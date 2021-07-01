//
//  ImagesTableViewCell.swift
//  NASA App
//
//  Created by Adonis Rumbwere on 30/6/2021.
//

import UIKit

class ImagesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nasaImage: UIImageView!
    
    @IBOutlet weak var nasaTitle: UILabel!
    
    @IBOutlet weak var nasaDate: UILabel!
    
    @IBOutlet weak var nasaPhotographer: UILabel!
    
    
    //Setup imagaes data values
    
    func setCellWithValueOf(_ images:Data){
        updateUI(title: images.title, dateCreated: images.date_created, Photographer: images.photographer, image: images.description)
    }
    
    private var urlString: String = ""
    
    //Update the UI Views
    
    private func updateUI(title: String?, dateCreated: String?, Photographer: String?, image: String?){
        
        self.nasaTitle.text = title
        self.nasaPhotographer.text = Photographer
        self.nasaDate.text = convertDateFormater(dateCreated)
        
    }
    
    // MARK: - Convert date format
    func convertDateFormater(_ date: String?) -> String {
        var fixDate = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let originalDate = date {
            if let newDate = dateFormatter.date(from: originalDate) {
                dateFormatter.dateFormat = "dd.MM.yyyy"
                fixDate = dateFormatter.string(from: newDate)
            }
        }
        return fixDate
    }
    
    
    
}
