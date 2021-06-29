//
//  Parser.swift
//  NASA App
//
//  Created by Adonis Rumbwere on 28/6/2021.
//

import Foundation

class APIService: NSObject {
    
    private let url = URL(string: "https://images-api.nasa.gov/search?q=%22%22")!
    
    func getImagesDataApi(completion: @escaping (CollectionData)-> ()){
        
        URLSession.shared.dataTask(with: url){ data , response, error in
            
            if let data = data {
                let json = try! JSONDecoder().decode(CollectionData.self, from: data)
                print(json)
                completion(json)
                
            }
        }
    }
}
