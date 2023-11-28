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
    @Published var askOrderBook: [OrderBook] = []
    @Published var bidOrderBook: [OrderBook] = []
    
    let market: Market
    
    init(market: Market) {
        self.market = market
    }
    
    func timer() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
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
    
    func showlargestAskSize() -> Double {
        let data = askOrderBook
            .sorted {
                $0.size > $1.size
            }
        return data.first?.size ?? 0
    }
    
    func showlargestBidSize() -> Double {
        let data = bidOrderBook
            .sorted {
                $0.size > $1.size
            }
        return data.first?.size ?? 0
    }
    
    func fetchOrderbook() {
        guard let url = URL(string: "https://api.upbit.com/v1/orderbook?markets=BTC-ETH") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                
                let decoder = JSONDecoder()
                
                guard let data = data else {
                    print("\(error.localizedDescription)")
                    return
                }
                
                do {
                    let decodedData = try decoder.decode([OrderBookResponseDTO].self, from: data)
                    
                    DispatchQueue.main.async {
                        
                        let result = decodedData.first?.orderbookUnits ??
                        [OrderBookUnit(
                            askPrice: 0,
                            bidPrice: 0,
                            askSize: 0.0,
                            bidSize: 0.0
                        )]
                        
                        let ask = result
                            .map { unit in
                                OrderBook(
                                    price: unit.askPrice,
                                    size: unit.askSize
                                )
                            }
                            .sorted { $0.price > $1.price }
                        
                        let bid = result
                            .map { unit in
                                OrderBook(
                                    price: unit.bidPrice,
                                    size: unit.bidSize
                                )
                            }
                            .sorted { $0.price > $1.price }
                        
                        self.askOrderBook = ask
                        self.bidOrderBook = bid
                        
                        print("============ ASSIGNED")
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


