//
//  ImagesModel.swift
//  NASA App
//
//  Created by Adonis Rumbwere on 28/6/2021.
//

import Foundation

struct CollectionData: Codable {
    
    var collection: Collection?
    
}

struct Collection: Codable {
    
    var items: [Item]?
}

struct Item: Codable {

    var href: String?
    var links: [LinksData]?
    var data:  [Data]?
    
    enum CodingKeys: String, CodingKey {
        
        case href     = "href"
        case links    = "links"
        case data     = "data"
    }
    
}


struct Data: Codable {
    
    var keywords: [String]?
    var media_type: String?
    var nasa_id: String?
    var date_created: String?
    var description: String?
    var center: String?
    var title: String?
    var photographer: String?
    
    
    enum CodingKeys: String, CodingKey {
        
        
        case keywords        = "keywords"
        case media_type      = "media_type"
        case nasa_id         = "nasa_id"
        case date_created    = "date_created"
        case description     = "description"
        case center          = "center"
        case title           = "title"
        case photographer    = "photographer"
    }
}



struct LinksData: Codable {
    
    var render: String?
    var rel: String?
    var href: String?
    
    enum CodingKeys: String, CodingKey {
        case render   = "render"
        case rel      = "rel"
        case href     = "href"
    }
}


