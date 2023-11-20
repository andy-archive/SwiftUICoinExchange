//
//  ContentView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    bannerView()
                    LazyVStack {
                        ForEach(1..<50) { data in
                            listView(data: data)
                        }
                    }
                }
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
                Text("123,232,123 원")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
