//
//  Film.swift
//  StarWars
//
//  Created by Ratul Chhibber on 16/09/20.
//  Copyright © 2020 Ratul Chhibber. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Film: Codable {
    let title: String
    let openingCrawl: String

    enum CodingKeys: String, CodingKey {
        case title
        case openingCrawl = "opening_crawl"
    }
}
