//
//  MainRouter.swift
//  Zorra
//
//  Created by Александр Осипов on 22.09.2020.
//

import Foundation

protocol MainRouterProtocol {
    func showDescription(with model: Model)
}

class MainRouter: MainRouterProtocol {
    
    weak var viewController: MainViewController?
    
    func showDescription(with model: Model) {
        let DVC = DescriptionViewController()
        DVC.model = model
        viewController?.navigationController?.pushViewController(DVC, animated: true)
    }
}
