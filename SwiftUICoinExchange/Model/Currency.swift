//
//  CurrencyDTO.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/27/23.
//

import Foundation

struct Currency: Identifiable {
    let id = UUID()
    let name : String
    let priceInUSD = Int.random(in: 10...1000)
}
