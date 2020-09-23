//
//  DescriptionPresenter.swift
//  Zorra
//
//  Created by Александр Осипов on 23.09.2020.
//

import Foundation

import Foundation

protocol DescriptionPresenterProtocol: class {
    
}

class DescriptionPresenter: DescriptionPresenterProtocol {
    
    weak var viewController: DescriptionViewControllerProtocol?
    var router: DescriptionRouterProtocol?
    
}
