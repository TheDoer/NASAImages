//
//  ImagesViewModel.swift
//  NASA App
//
//  Created by Adonis Rumbwere on 29/6/2021.
//

import Foundation
import RxSwift
import RxCocoa

class ImagesViewModel {
    
    var items = PublishSubject<[Item]>()
    
    private var apiService = APIService()
    private var nasaImages = [Item]()
    private var bag = DisposeBag()
    
     
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
        
        items.onNext(nasaImages)
        items.onCompleted()
    }
    
    
    func numberOfRowsInSection(section: Int) -> Int {
//        if nasaImages.count != 0 {
//            return nasaImages.count
//        }
        
        return 0
    }
    
    func cellForAt (indexPath: IndexPath) -> Item {
        return nasaImages[indexPath.row]
    }
    
}
