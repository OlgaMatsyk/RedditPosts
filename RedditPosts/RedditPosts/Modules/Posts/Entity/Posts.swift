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
    let totalComments: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
