//
//  DescriptionRouter.swift
//  Zorra
//
//  Created by Александр Осипов on 23.09.2020.
//

import Foundation

protocol DescriptionRouterProtocol {
    
}

class DescriptionRouter: DescriptionRouterProtocol {
    
    weak var viewController: DescriptionViewController?
    weak var presenter: DescriptionPresenterProtocol?
    
}
