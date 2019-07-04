//
//  EndPoints.swift
//  RedditPosts
//
//  Created by Olga Matsyk on 7/3/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://www.reddit.com/r/all/top/.json?t=all&limit=1"
    static let moreItemsUrl = "https://www.reddit.com/r/all/top/.json?t=all&limit=10&after=%d"
}
