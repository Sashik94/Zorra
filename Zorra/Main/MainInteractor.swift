//
//  MainInteractor.swift
//  Zorra
//
//  Created by Александр Осипов on 22.09.2020.
//

import Foundation

protocol MainInteractorProtocol {
    func makeRequest(page: Int)
}

class MainInteractor: MainInteractorProtocol {
    
    var networking: Networking?
    var presenter: MainPresenterProtocol?
    
    func makeRequest(page: Int) {
        if networking == nil {
            networking = Networking()
        }
        networking?.getData(from: page) { [weak self] result in
            switch result {
            case .success(let data):
                do {
                    let tracks = try JSONDecoder().decode([Model].self, from: data)
                    self!.presenter?.presentModel(response: .success(models: tracks))
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    self!.presenter?.presentModel(response: .failure(error: jsonError.localizedDescription))
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                self!.presenter?.presentModel(response: .failure(error: error.localizedDescription))
            }
        }
    }
}
