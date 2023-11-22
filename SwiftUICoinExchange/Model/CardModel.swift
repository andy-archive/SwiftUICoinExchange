//
//  CardModel.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/22.
//

import SwiftUI

struct CardModel: Hashable {
    let color = Color.random()
    let name: String
    let index: Int
}

var cardModelData: [CardModel] = [
    CardModel(name: "Andy Burger", index: 0),
    CardModel(name: "Ssaboo King", index: 1),
    CardModel(name: "McCallie's", index: 2),
    CardModel(name: "Noah's Patty", index: 3)
]
