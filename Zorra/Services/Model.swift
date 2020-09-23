//
//  Model.swift
//  Zorra
//
//  Created by Александр Осипов on 22.09.2020.
//

import Foundation

class Model: Decodable {
    var name: String?
    var imageUrl: String?
    var imageData: Data?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageUrl = "image_url"
//        case imageData
        case description
    }
    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        self.name = try container.decode(String.self, forKey: .name)
//        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
////        if let imageUrlString = try? container.decode(String.self, forKey: .imageUrl) {
////            self.imageUrl = imageUrlString
////        DispatchQueue.global(qos: .userInteractive).async {
////                if let imageUrl = URL(string: imageUrlString) {
////                    self.imageData = try? Data(contentsOf: imageUrl)
////                }
////            }
////        }
//        self.description = try container.decode(String.self, forKey: .description)
//    }
    
}
