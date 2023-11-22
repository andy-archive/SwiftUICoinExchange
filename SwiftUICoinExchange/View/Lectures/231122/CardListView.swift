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
            makeCardList()
            HStack(spacing: 30) {
                Button("Animation ON") {
                    withAnimation(.bouncy(duration: 0.8)) { // 딜레이
                        isExpandable = true
                    }
                }
                Button("Animation OFF") {
                    withAnimation(.smooth(duration: 0.8, extraBounce: 0.2)) {
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
    
    func makeCardList() -> some View {
        ScrollView {
            ForEach(0..<5) { item in
                makeCard(index: item)
            }
        }
    }
    
    func makeCard(index: Int) -> some View {
        RoundedRectangle(cornerRadius: 15.0)
            .fill(Color.random())
            .frame(height: 150)
            .padding(.horizontal)
            .padding(.vertical, 4)
            .offset(
                y: CGFloat(index) * (isExpandable ? 0 : -130)
            )
            .onTapGesture {
                withAnimation(.smooth(duration: 0.8, extraBounce: 0.2)) {
                    isExpandable.toggle()
                }
            }
    }
    
    func topOverlayButton() -> some View {
        Button(action: {
            withAnimation {
                isExpandable = false
            }
        }, label: {
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .padding()
                .background(.black, in: Circle())
        })
        .rotationEffect(
            .degrees(isExpandable ? 45 : 270)
        )
        .opacity(isExpandable ? 1 : 0)
    }
}

#Preview {
    CardListView()
}

/* 📌 offset 사고과정
 func makeCardList() -> some View {
     ScrollView {
//            makeCard()
//            makeCard()
//                .offset(y: -130)
//            makeCard()
//                .offset(y: -260)
//            makeCard()
//                .offset(y: -390)
         ForEach(0..<5) { item in
             makeCard(index: item)
         }
     }
 }
 */
