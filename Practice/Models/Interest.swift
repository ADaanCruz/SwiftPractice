//
//  Interest.swift
//  Practice
//
//  Created by Adán Cruz on 10/08/21.
//

import Foundation
import ObjectMapper

class Interest: Mappable {
    
    var id: Int!
    var topic: Topic!
    var userId: Int!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        topic <- map["topic"]
        userId <- map["user_id"]
    }
    
    public static func fetchInterest(completion: @escaping (_ response: [Interest]?) -> Void) {
        Api.fetchInterest(completion: completion)
    }
    
}
