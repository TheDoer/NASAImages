//
//  ImagesViewModel.swift
//  NASA App
//
//  Created by Adonis Rumbwere on 29/6/2021.
//

import Foundation

class ImagesViewModel {
    
    private var apiService = APIService()
    private var nasaImages = [Item]()
    
    
    func fetchImagesData(completion: @escaping () -> ()) {
        
        //weak self - prevent retain cycles
        
        apiService.getImagesData { (result) in
            switch result {
                case .success(let listOf):
                    self.nasaImages = (listOf.collection.items)!
                    print("NASA ImageData: \(self.nasaImages)")
                    completion()
                case .failure(let error):
                    print("Error processing json data:\(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if nasaImages.count != 0 {
            return nasaImages.count
        }
        
        return 0
    }
    
    func cellForAt (indexPath: IndexPath) -> Item {
        return nasaImages[indexPath.row]
    }
}
