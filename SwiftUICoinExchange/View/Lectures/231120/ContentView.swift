//
//  ContentView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
        .padding()
    }
    
    
    func bannerView() -> some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.gray)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 200)
    }
    
    func listView(data: Int) -> some View {
        HStack {
            VStack {
                Text("코인 이름 \(data)")
                    .bold()
                Text("COIN NAME \(data)")
                    .fontWeight(.light)
            }
            Spacer()
            Text("KRW-BTC")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
