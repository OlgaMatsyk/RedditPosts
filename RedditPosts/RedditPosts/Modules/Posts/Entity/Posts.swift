//
//  Posts.swift
//  RedditPosts
//
//  Created by Olga Matsyk on 7/3/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//


import Foundation

struct Posts: Codable {
    let status: String?
    var articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let author: String?
    let title: String?
    let thumbnail: String?
    let created: Double?
    let num_comments: Int?
    var unreadStatus: Bool
}
