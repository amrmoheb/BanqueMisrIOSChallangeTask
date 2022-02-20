//
//  MakesListViewModel.swift
//  BanqueMisrIOSChallangeTask
//
//  Created by Mohamed Elzohirey on 19/02/2022.
//

import Foundation
import RxSwift
import RxCocoa
class MakesListViewModel {

    var makesList = BehaviorRelay<[Result]>(value: [])
    var currentPage = 0
    var loadingNextPage = false
    var totalNumberOfPages = 1
    var networkLayer: NetworkLayer
    var errorNotifier = PublishSubject<BanqueMisrError>()

    init() {
        networkLayer = NetworkLayer()
    }
    func fetchMoreData() {
        if !loadingNextPage && totalNumberOfPages > currentPage {
        loadAllMakesNames(pageNumber: currentPage)
        }
    }

    func loadAllMakesNames(pageNumber: Int = 1) {
        loadingNextPage = true
       networkLayer.getRequest(model: AllMakesResponse.self, requestConfiq: NetworkRouter.getAllMakes(pageNumber)) {[weak self] response in
            switch response {
            case .success(let makesList):
                if let currentList = self?.makesList.value {
                   // var tempArray = currentList + makesList.results
                  //  tempArray.sort{$0.name < $1.name}
                    self?.makesList.accept(currentList + makesList.results)
                    self?.totalNumberOfPages =  makesList.totalPages
                    self?.currentPage += 1
                    print("currentPage\( self?.currentPage)+\(self?.totalNumberOfPages)")
                    self?.loadingNextPage = false
                }

                break
            case .failier(let error):
                self?.errorNotifier.onNext(error)
                break

            }

        }
    }
}
