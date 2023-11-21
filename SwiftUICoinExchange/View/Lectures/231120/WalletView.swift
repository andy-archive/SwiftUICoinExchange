//
//  WalletView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/20.
//

import SwiftUI

struct WalletView: View {
    
    @State private var banner = "35,123,392,122,221"
    
    @available(iOS 17.0, *)
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(1..<5) { data in
                                bannerView()
                                    .containerRelativeFrame(.horizontal)
                                    // iOS 17.0+ 디바이스 너비에 맞게 해결
                            }
                        }
                        // 스크롤 하고자 하는 대상에 대한 레이아웃 설정
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .safeAreaPadding([.horizontal], 4)
                    LazyVStack {
                        ForEach(1..<50) { data in
                            listView(data: data)
                        }
                    }
                    /* 📌 LazyVStack이 보이지 않는 이유
                     -> 사실 보이지 않는 게 아니라 listView() 내부의 Spacer()에 의해
                        잘려서 안 보이는 것이다
                     -> 스크롤 지정 필요 -> embed ScrollView(.horizontal)
                     */
                }
            }
            .refreshable { // iOS 15.0+
                banner = "\(Int.random(in: 10_000_000...100_000_000_000_000).formatted())"
            }
            .navigationTitle("My Wallet")
        }
        .padding()
    }
    
    
    func bannerView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.gray)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 거래 현황")
                    .fontWeight(.light)
                Text(banner)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .padding(8)
    }
    
    func listView(data: Int) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("코인 이름 \(data)")
                    .bold()
                Text("COIN NAME \(data)")
                    .fontWeight(.light)
            }
            Spacer()
            Text("KRW-BTC")
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

#Preview {
    WalletView()
}

