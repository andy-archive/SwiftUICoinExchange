//
//  HorizontalView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/27/23.
//

import SwiftUI

struct HorizontalView: View {
    
    @StateObject var viewModel = HorizontalViewModel()
    
    var body: some View {
        ScrollView {
            Text(String(viewModel.time))
            Button(action: {
                viewModel.timer()
            }, label: {
                Text("Timer")
            })
            GeometryReader { proxy in
                
                let graphWidth = proxy.size
                
                VStack(spacing: 20) {
                    ForEach(currencyDummy, id: \.id) { item in
                        HStack(alignment: .center, spacing: 10) {
                            Text(item.name)
                                .frame(width: proxy.size.width * 0.2)
                            ZStack(alignment: .center) {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(Color.blue.opacity(0.4))
                                    .frame(width: CGFloat(item.priceInUSD) / 5)
                                    .frame(maxWidth: proxy.size.width * 0.7)
                                Text(item.priceInUSD.formatted())
                            }
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.6))
                        }
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
