//
//  ModelsListViewController.swift
//  BanqueMisrIOSChallangeTask
//
//  Created by Mohamed Elzohirey on 20/02/2022.
//

import UIKit
import RxSwift

class ModelsListViewController: UIViewController {
    @IBOutlet weak var modelsTableView: UITableView!
    var modelsViewModel =  ModelsListViewModel()
    var bag = DisposeBag()
    var makeName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        modelsViewModel.loadAllModels(makeName: makeName)

        modelsViewModel.modelsList.bind(to: modelsTableView.rx.items(cellIdentifier: "modelCellID", cellType: ModelsTableViewCell.self)) { (_, item, cell) in
            cell.setModelName(name: item.name)
                    }.disposed(by: bag)
        modelsTableView.rx.didScroll.subscribe { [weak self] _ in
                    guard let self = self else { return }
                    let offSetY = self.modelsTableView.contentOffset.y
                    let contentHeight = self.modelsTableView.contentSize.height

            if offSetY > (contentHeight - self.modelsTableView.frame.size.height - 100) {
                self.modelsViewModel.fetchMoreData(makeName: self.makeName)
                    }
                }
                .disposed(by: bag)
      modelsViewModel.errorNotifier
          .subscribe(onNext: {[weak self] error in
              print(error.message)
              self?.showAlert(error: error) {[weak self] _ in
                  self?.back()
              }
          })

    }

    func showAlert(error: BanqueMisrError, action : @escaping (UIAlertAction) -> Void) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: error.type?.rawValue, message: error.message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: action))
        self.present(alert, animated: true, completion: nil)
        }
    }
    func back() {
        _ = navigationController?.popToRootViewController(animated: true)
    }
}
