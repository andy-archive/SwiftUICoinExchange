//
//  WalletViewModel.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/21.
//

import Foundation

final class WalletViewModel: ObservableObject {
    
    
    @Published var banner = Banner()
    @Published var marketList = [Market]()
    
    func fetchBanner() {
        banner = Banner()
    }
    
    func fetchAllMarket() {
        
        guard let url = URL(string: "https://api.upbit.com/v1/market/all") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                
                guard let data = data else {
                    print("\(error.localizedDescription)")
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode([Market].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.marketList = decodedData
                    }
                } catch {
                    print("\(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }
}
