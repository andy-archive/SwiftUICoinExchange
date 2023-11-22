//
//  CardListView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/22.
//

import SwiftUI

struct CardListView: View {
    
    @State private var isExpandable = false
    
    var body: some View {
        VStack {
            topTItle()
            Spacer()
            HStack(spacing: 30) {
                Button("Animation ON") {
                    withAnimation(.bouncy(duration: 1.2)) { // 딜레이
                        isExpandable = true
                    }
                }
                Button("Animation OFF") {
                    withAnimation(.smooth(duration: 1, extraBounce: 0.4)) {
                        isExpandable = false
                    }
                }
            }
            .padding()
        }
    }
    
    func topTItle() -> some View {
        Text("Andy's Wallet")
            .font(.largeTitle)
            .bold()
            .padding()
            .frame(
                maxWidth: .infinity,
                alignment: isExpandable ? .leading : .center
            )
            .overlay(alignment: .trailing) {
                topOverlayButton()
            }
            .padding(12)
    }
    
    func topOverlayButton() -> some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .padding()
                .background(.black, in: Circle())
        })
        .rotationEffect(
            .degrees(isExpandable ? 270 : 45)
        )
        .opacity(isExpandable ? 1 : 0)
    }
}

#Preview {
    CardListView()
}
