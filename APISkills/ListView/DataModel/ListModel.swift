//
//  ListModel.swift
//  APISkills
//
//  Created by apple on 01/05/24.
//

import Foundation

struct ListModel : Codable {

        let userId : Int?
        let id : Int?
        let title : String?
        let body : String?

        enum CodingKeys: String, CodingKey {
                case userId = "userId"
                case id = "id"
                case title = "title"
                case body = "body"
        }
}

