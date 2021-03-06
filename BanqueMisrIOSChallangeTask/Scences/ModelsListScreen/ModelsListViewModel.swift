//
//  ModelsListViewModel.swift
//  BanqueMisrIOSChallangeTask
//
//  Created by Mohamed Elzohirey on 20/02/2022.
//

import Foundation
import RxSwift
import RxCocoa
class ModelsListViewModel {
    var networkLayer: NetworkLayer
    var modelsList = BehaviorRelay<[ModelsResult]>(value: [])
    var errorNotifier = PublishSubject<BanqueMisrError>()
    var currentPage = 0
    var loadingNextPage = false
    var totalNumberOfPages = 1
    init() {
        networkLayer = NetworkLayer()
    }
    func fetchMoreData(makeName: String) {
        if !loadingNextPage && totalNumberOfPages > currentPage {
            loadAllModels(makeName: makeName, pageNumber: currentPage)
        }
    }
    func loadAllModels(makeName: String, pageNumber: Int = 1) {
        loadingNextPage = true
        networkLayer.getRequest(model: ModelsResponse.self, requestConfiq: NetworkRouter.getMakeModels(makeName, 1)) {[weak self] response in
            switch response {
            case .success(let modelList):
                if modelList.totalNumber == 0 {
                let error = BanqueMisrError(message: "No models for this brand ")
                    self?.errorNotifier.onNext(error)
                }
                if let currentList = self?.modelsList.value {
                   // var tempArray = currentList + makesList.results
                  //  tempArray.sort{$0.name < $1.name}
                    self?.modelsList.accept(currentList + modelList.results)
                    self?.totalNumberOfPages =  modelList.totalPages
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
