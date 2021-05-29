//
//  User.swift
//  GitMVP
//
//  Created by Mahmoud Aziz on 29/05/2021.
//

import Foundation

struct User: Decodable {
    let name: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case avatar = "avatar_url"
    }
}
