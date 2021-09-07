//
//  Topic.swift
//  Practice
//
//  Created by Adán Cruz on 10/08/21.
//

import Foundation
import ObjectMapper

class Topic: Mappable {
    
    var id: Int!
    var name: String!
    var imageURL: String!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id   <- map["id"]
        name <- map["name"]
        imageURL <- map["image_url"]
    }
    
}
