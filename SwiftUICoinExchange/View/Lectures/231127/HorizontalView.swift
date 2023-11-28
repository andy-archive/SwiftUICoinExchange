//
//  HorizontalView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/27/23.
//

import SwiftUI

struct HorizontalView: View {
    
    /* View의 변화를 @StateObject를 통해 ViewModel에 전달 */
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
                
                let graphWidth = proxy.size.width
                
                VStack(spacing: 20) {
                    ForEach(currencyDummy, id: \.id) { item in
                        HStack(alignment: .center, spacing: 10) {
                            Text(item.name)
                                .frame(width: graphWidth * 0.2)
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(Color.blue.opacity(0.4))
                                    .frame(width: CGFloat(item.priceInUSD) / 5)
                                    .frame(maxWidth: graphWidth * 0.7, alignment: .leading)
                                Text(item.priceInUSD.formatted())
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
