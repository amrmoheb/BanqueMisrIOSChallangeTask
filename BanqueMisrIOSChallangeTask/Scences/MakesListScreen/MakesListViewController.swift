//
//  MakesListViewController.swift
//  BanqueMisrIOSChallangeTask
//
//  Created by Mohamed Elzohirey on 19/02/2022.
//

import UIKit
import RxSwift
import RxCocoa

class MakesListViewController: UIViewController {

    @IBOutlet weak var makesListTableView: UITableView!
    var makesListViewModel = MakesListViewModel()
    private let bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        makesListViewModel.loadAllMakesNames()

        makesListViewModel.makesList.bind(to: makesListTableView.rx.items(cellIdentifier: "makeCellID", cellType: MakeTableViewCell.self)) { (_, item, cell) in
            cell.setMakeName(name: item.name)
                    }.disposed(by: bag)

        makesListTableView.rx.didScroll.subscribe { [weak self] _ in
                    guard let self = self else { return }
                    let offSetY = self.makesListTableView.contentOffset.y
                    let contentHeight = self.makesListTableView.contentSize.height

            if offSetY > (contentHeight - self.makesListTableView.frame.size.height - 100) {
                        self.makesListViewModel.fetchMoreData()
                    }
                }
                .disposed(by: bag)
        makesListTableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
             // let cell = self?.tableview.cellForRow(at: indexPath) as? SomeCellClass
                let nextViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ModelsListViewController") as? ModelsListViewController
                nextViewController?.makeName = self?.makesListViewModel.makesList.value[indexPath.row].niceName ?? ""
                if let nextVC = nextViewController
                {
                self?.navigationController?.pushViewController(nextVC, animated: true)
                }
            }).disposed(by: bag)
        makesListViewModel.errorNotifier
            .subscribe(onNext: {[weak self] error in
                print(error.message)
                self?.showAlert(error: error)
            })

    }
    func showAlert(error: BanqueMisrError) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: error.type?.rawValue, message: error.message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        }
    }
}
