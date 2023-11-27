//
//  CurrencyDTO.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/27/23.
//

import Foundation

struct CurrencyDTO: Identifiable {
    let id = UUID()
    let name : String
    let priceInUSD = Int.random(in: 10...1000)
}

let currencyDummy = [
    CurrencyDTO(name: "ANDY"),
    CurrencyDTO(name: "NOAH"),
    CurrencyDTO(name: "SSABOO"),
    CurrencyDTO(name: "JOEY"),
    CurrencyDTO(name: "CALLIE"),
    CurrencyDTO(name: "YERI")
]
