//
//  Repo.swift
//  GitMVP
//
//  Created by Mahmoud Aziz on 29/05/2021.
//

import Foundation

struct Repo: Decodable {
    let name: String
    let starsCount: Int
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
        case starsCount = "stargazers_count"

    }
   
}


