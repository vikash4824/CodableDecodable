//
//  Actors.swift
//  CodableDecodable
//
//  Created by mamidisetty Vikash on 05/03/21.
//

import Foundation
struct Actors : Codable {

        let body : String?
        let email : String?
        let id : Int?
        let name : String?
        let postId : Int?

        enum CodingKeys: String, CodingKey {
                case body = "body"
                case email = "email"
                case id = "id"
                case name = "name"
                case postId = "postId"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                body = try values.decodeIfPresent(String.self, forKey: .body)
                email = try values.decodeIfPresent(String.self, forKey: .email)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                postId = try values.decodeIfPresent(Int.self, forKey: .postId)
        }

}
