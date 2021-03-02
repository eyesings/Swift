//
//  StockListViewModel.swift
//  StocksAppSwiftUI
//
//  Created by Kim Tae won on 2021/03/01.
//

import Foundation


class StockListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var news: [NewsArticleViewModel] = [NewsArticleViewModel]()
    
    
    func load() {
        fetchNews()
        fetchStocks()
    }
    
    private func fetchNews() {
        
        Webservice().getTopNews { (news) in
            
            if let news = news {
                self.news = news.map(NewsArticleViewModel.init)
            }
            
        }
        
    }
    
    private func fetchStocks() {
        
        Webservice().getStocks { (stocks) in
            if let stocks = stocks {
                
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
    
}
