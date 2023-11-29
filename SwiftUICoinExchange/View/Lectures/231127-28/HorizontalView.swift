//
//  HorizontalView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/27/23.
//

import SwiftUI

struct HorizontalView: View {
    
    /* View의 변화를 @StateObject를 통해 ViewModel에 전달 */
    @StateObject var viewModel = HorizontalViewModel(
        market: Market(
            market: "MACY",
            koreanName: "메이시",
            englishName: "Macy"
        )
    )
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20, content: {
                Text(viewModel.market.koreanName)
                Text(String(viewModel.time))
                Button(action: {
                    viewModel.timer()
                }, label: {
                    Text("Timer")
                })
                Button(action: {
                    viewModel.fetchOrderbook()
                }, label: {
                    Text("FETCH OrderBook")
                })
            })

            GeometryReader { proxy in
                
                let graphWidth = proxy.size.width
                
                VStack(spacing: 20) {
                    ForEach(viewModel.askOrderBook, id: \.id) { item in
                        HStack(alignment: .center, spacing: 10) {
                            Text(item.price.formatted())
                                .frame(width: graphWidth * 0.2)
                            ZStack(alignment: .leading) {
                                
                                let graphSize = CGFloat(item.price) / CGFloat(viewModel.showlargestAskSize()) * graphWidth
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(Color.blue.opacity(0.4))
                                    .frame(maxWidth: graphSize, alignment: .leading)
                                Text(item.price.formatted())
                                    .frame(width: graphWidth)
                            }
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.6))
                        }
                        .frame(height: 50)
                    }
                }
                .background(Color.yellow.opacity(0.2))
                .onTapGesture {
                    print(proxy)
                    print(proxy.size)
                }
            }
        }
    }
}

#Preview {
    HorizontalView()
}
