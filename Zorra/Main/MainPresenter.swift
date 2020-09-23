//
//  MainPresenter.swift
//  Zorra
//
//  Created by Александр Осипов on 22.09.2020.
//

import Foundation

protocol MainPresenterProtocol: class {
    var router: MainRouterProtocol? { get set }
    func presentModel(response: ResultsType)
    func showDescription(with model: Model)
}

class MainPresenter: MainPresenterProtocol {
    
    weak var viewController: MainViewControllerProtocol?
    var router: MainRouterProtocol?
    
    func presentModel(response: ResultsType) {
        switch response {
        case .success(let models):
            viewController?.displayData(result: .success(models: models))
        case .failure(let error):
            print(error)
            viewController?.displayData(result: .failure(error: error))
        }
    }
    
    func showDescription(with model: Model) {
        router?.showDescription(with: model)
    }
    
}
