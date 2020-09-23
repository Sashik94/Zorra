//
//  Networking.swift
//  Zorra
//
//  Created by Александр Осипов on 22.09.2020.
//

import Foundation

enum ResultsType {
    case success(models: [Model])
    case failure(error: String)
}

protocol PresentModelProtocol {
    func presentModel(response: ResultsType)
}

class Networking {
    
    var delegate: PresentModelProtocol?
    
    func getData(from page: Int, completion: @escaping (Result<Data, Error>) -> Void) {
        let urlString = "https://api.punkapi.com/v2/beers?page=\(String(page))&per_page=80"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            completion(.success(data))
        }.resume()
    }
}
