//
//  Article.swift
//  GoodNews
//
//  Created by Kim Tae won on 2021/02/21.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
    let publishedAt: String
    let content: String?
}
