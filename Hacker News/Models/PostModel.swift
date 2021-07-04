//
//  PostModel.swift
//  Hacker News
//
//  Created by Sergei Romanchuk on 02.07.2021.
//

import Foundation

// MARK: - Pre-Object in JSON response
struct Results: Decodable {
    let hits: [PostModel]?
}

// MARK: - Post Entity
struct PostModel: Identifiable, Decodable {
    let id: String?
    let points: Int?
    let title: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "objectID"
        case points = "points"
        case title = "title"
        case url = "url"
    }
}
