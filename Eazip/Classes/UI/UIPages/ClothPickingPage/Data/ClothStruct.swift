//
//  Cloth.swift
//  Eazip
//
//  Created by Quentin Michalet on 26/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import Foundation

struct ClothStruct {
    let id: Int
    let image: String
    let label: String
    let type: String

    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }

    init(json:[String:Any]) throws {
        guard let id = json["id"] as? Int else { throw SerializationError.missing("id is missing")}
        guard let image = json["image"] as? String else { throw SerializationError.missing("image is missing")}
        guard let label = json["label"] as? String else { throw SerializationError.missing("label is missing")}
        guard let type = json["type"] as? String else { throw SerializationError.missing("type is missing")}

        self.id = id
        self.image = image
        self.label = label
        self.type = type
    }
    
//    static let basePath = "http://ec2-35-180-118-48.eu-west-3.compute.amazonaws.com/"
//
//    static func forecast (withLocation location:String, completion: @escaping ([ClothStruct]) -> ()) {
//
//        let url = basePath + location
//        let request = URLRequest(url: URL(string: url)!)
//        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
//
//            var forecastArray:[ClothStruct] = []
//
//            if let data = data {
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
//                        print("json")
//                    }
//                }
//            }
//
//            } as! (Data?, URLResponse?, Error?) -> Void as! (Data?, URLResponse?, Error?) -> Void

}
