//
//  UpbitAPI.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/21.
//

import Foundation

struct UpbitAPI {
    
    private init() { }
    
    static func fetchAllMarket(completion: @escaping ([Market]) -> Void) {
        
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
                    
                    DispatchQueue.main.async {
                        completion(decodedData)
                    }
                } catch {
                    completion(nil)
                    print("\(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }
}
