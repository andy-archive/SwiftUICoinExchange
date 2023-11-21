//
//  UpbitAPI.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/21.
//

import Foundation

// 데이터에 대한 응답 구조
struct Market: Codable {
    
    let market: String
    let koreanName: String
    let englishName: String
    
    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}


struct UpbitAPI {
    
    private init() { }
    
    static func fetchAllMarket() {
        
        guard let url = URL(string: "https://api.upbit.com/v1/market/all") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                
                guard let data = data else {
                    print("\(error.localizedDescription)")
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(Market.self, from: data)
                    print(decodedData)
                } catch {
                    print("\(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }
}
