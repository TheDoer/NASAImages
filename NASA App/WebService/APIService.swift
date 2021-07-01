//
//  Parser.swift
//  NASA App
//
//  Created by Adonis Rumbwere on 28/6/2021.
//

import Foundation

class APIService {
    
    private var dataTask: URLSessionDataTask?
    
    func getImagesData(completion: @escaping(Result<CollectionData, Error>) -> Void) {
        
        let nasaImagesUrl = "https://images-api.nasa.gov/search?q=%22%22"
        
        guard let url = URL(string: nasaImagesUrl) else { return }
        
        //Create URL Session - work on the background
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //Handle Error
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                //Handle Empty Response
                return
            }
            
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                //Handle Empty Data
                print("Empty Data")
                return
            }
            
            do {
                //Parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(CollectionData.self, from: data)
                
                //Back to the mnain thread
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
        
    }
      
}
