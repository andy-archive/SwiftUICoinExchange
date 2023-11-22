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
    CardModel(name: "Sand Andy", index: 0),
    CardModel(name: "Ssaboo King", index: 1),
    CardModel(name: "McCallie's", index: 2),
    CardModel(name: "Noah's Patty", index: 3),
    CardModel(name: "Joey's Bagel", index: 4),
    CardModel(name: "It's Domb's", index: 5),
]
