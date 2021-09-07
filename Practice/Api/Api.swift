//
//  Api.swift
//  Practice
//
//  Created by Adán Cruz on 10/08/21.
//

import Foundation

class Api {
    
    public static func fetchInterest(completion: @escaping(_ response: [Interest]?) -> Void) {
        var response: [Interest] = []
        for i in 1...20 {
            let dataWS = """
            {\
            \"id\": \(i),\
            \"user_id\": 1,\
            \"topic\": {\
            \"id\": \(i + 10),\
            \"name\": \"Tema de interés \(i)\",\
            \"image_url\": \"https://img.icons8.com/color/452/swift.png\"\
            }
            }
            """
            
            let interest = Interest(JSONString: dataWS)
            response.append(interest!)
        }
        completion(response)
    }
    
}
