//
//  OrderBook.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/28/23.
//

import Foundation

/* Entities - 화면에 보여줄 데이터 타입 */
struct OrderBook: Hashable, Identifiable {
    let id = UUID()
    let price: Int
    let size: Double
}
