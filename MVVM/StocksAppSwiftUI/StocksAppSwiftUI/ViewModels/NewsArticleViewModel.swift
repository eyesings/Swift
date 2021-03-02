//
//  NewsArticleViewModel.swift
//  StocksAppSwiftUI
//
//  Created by Kim Tae won on 2021/03/03.
//

import Foundation

struct NewsArticleViewModel {
    
    
    let article: Article
    
    var imageURL: String {
        return self.article.imageURL
    }
    
    var title: String {
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
}
