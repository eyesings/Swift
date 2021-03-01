//
//  StockListViewModel.swift
//  StocksAppSwiftUI
//
//  Created by Kim Tae won on 2021/03/01.
//

import Foundation


class StockListViewModel: ObservableObject {
    
    var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    
    func load() {
        fetchStocks()
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
