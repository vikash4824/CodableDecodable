//
//  Json.swift
//  CodableDecodable
//
//  Created by mamidisetty Vikash on 05/03/21.
//

import Foundation
struct Json : Codable {

        let body : String?
        let id : Int?
        let title : String?
        let userId : Int?

        enum CodingKeys: String, CodingKey {
                case body = "body"
                case id = "id"
                case title = "title"
                case userId = "userId"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                body = try values.decodeIfPresent(String.self, forKey: .body)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                title = try values.decodeIfPresent(String.self, forKey: .title)
                userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        }

}
