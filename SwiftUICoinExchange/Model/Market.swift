//
//  Market.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/21.
//

import Foundation

/*
 Identifiable - 구조체의 값이 같을 때에도 다르게 처리 (선택)
 Hashable - 고유성 보장 (필수)
 */

// 데이터에 대한 응답 구조
struct Market: Hashable, Codable {
    
    let market: String
    let koreanName: String
    let englishName: String
    
    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}
