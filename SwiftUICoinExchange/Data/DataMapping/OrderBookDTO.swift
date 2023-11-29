//
//  OrderBookDTO.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/28/23.
//

import Foundation

/* ResponseDTO 네트워크 응답을 위한 데이터 타입 */
struct OrderBookResponseDTO: Decodable {
    let market: String
    let timestamp: Int
    let totalAskSize, totalBidSize: Double
    let orderbookUnits: [OrderBookUnit]

    enum CodingKeys: String, CodingKey {
        case market, timestamp
        case totalAskSize = "total_ask_size"
        case totalBidSize = "total_bid_size"
        case orderbookUnits = "orderbook_units"
    }
}

struct OrderBookUnit: Decodable {
    let askPrice, bidPrice: Int
    let askSize, bidSize: Double

    enum CodingKeys: String, CodingKey {
        case askPrice = "ask_price"
        case bidPrice = "bid_price"
        case askSize = "ask_size"
        case bidSize = "bid_size"
    }
}
