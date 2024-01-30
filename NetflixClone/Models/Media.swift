//
//  Media.swift
//  NetflixClone
//
//  Created by Indrek Mäeots on 27.01.2024.
//

import Foundation

struct TrendingMediaResponse: Codable {
    let results: [Media]
}

struct Media: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
