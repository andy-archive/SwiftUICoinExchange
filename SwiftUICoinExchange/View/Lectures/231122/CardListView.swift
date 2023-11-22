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
            Button("AnimationOn") {
                withAnimation(.bouncy) { // 딜레이
                    isExpandable = true
                }
            }
            Button("AnimationOff") {
                withAnimation(.smooth(duration: 1, extraBounce: 0.8)) {
                    isExpandable = false
                }
            }
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
            .background(.yellow)
    }
    

#Preview {
    CardListView()
}
