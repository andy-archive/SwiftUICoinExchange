//
//  HorizontalViewModel.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/27/23.
//

import Foundation

/* ObservableObject 프로토콜을 이용하여 관찰자 시점 적용 */
final class HorizontalViewModel: ObservableObject {
   
    @Published var time = 0.0 // View가 아니므로 @State가 아닌 @Published
    @Published var dummy: [Currency] = []
    
    func timer() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            self.time += 0.5
            self.fetchDummyData() // 0.5초마다 데이터 변화
        }
    }
    
    func fetchDummyData() {
        
        dummy = [
            Currency(name: "ANDY"),
            Currency(name: "NOAH"),
            Currency(name: "SSABOO"),
            Currency(name: "JOEY"),
            Currency(name: "CALLIE"),
            Currency(name: "YERI")
        ]
    }
    
    func showlargest() -> Int {
        let data = dummy.sorted { $0.priceInUSD > $1.priceInUSD
        }
        return data[0].priceInUSD
    }
        
            }
        }
    }
}


