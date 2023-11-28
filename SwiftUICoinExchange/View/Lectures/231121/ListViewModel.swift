//
//  ListViewModel.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/21.
//

import Foundation

/* 관찰하기 위한 프로토콜(ObservableObject) 채택 */
final class ListViewModel: ObservableObject {
    
    @Published var marketList: [Market] = [
        Market(
            market: "Emart",
            koreanName: "이마트",
            englishName: "e-mart"
        ),
        Market(
            market: "WallMart",
            koreanName: "월마트",
            englishName: "wallmart"
        )
    ]
    
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
                        print(decodedData)
                        self.marketList = decodedData
                    }
                    print("COMPLETE ---------------------")
                } catch {
                    print("\(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }
}
