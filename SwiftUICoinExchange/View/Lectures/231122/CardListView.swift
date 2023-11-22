//
//  CardListView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/22.
//

import SwiftUI

struct CardListView: View {
    
    @State private var isExpandable = false
    @State private var isCardDetailViewPresented = false
    @State private var cardList = cardModelData
    @State private var selectedCard = CardModel(name: "", index: 0)
    @Namespace var animation //: Namespace.ID // 동일한 그룹임을 인식
    
    var body: some View {
        VStack {
            topTitle(name: "Andy")
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
        .overlay(content: {
            if isCardDetailViewPresented {
                CardDetailView(
                    isViewPresented: $isCardDetailViewPresented,
                    currentCard: selectedCard,
                    animation: animation
                )
            }
        })
    }
    
    func topTitle(name: String) -> some View {
        Text("\(name)'s Wallet")
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
            ForEach(cardList, id: \.self) { item in
                makeCard(item)
            }
        }
        .overlay {
            Rectangle()
                .fill(.black
                    .opacity(isExpandable ? 0 : 0.01)
                )
                .onTapGesture {
                    withAnimation {
                        isExpandable.toggle()
                    }
                }
        }
    }
    
    func makeCard(_ data: CardModel) -> some View {
        RoundedRectangle(cornerRadius: 15.0)
            .fill(Color.random())
            .frame(height: 150)
            .padding(.horizontal)
            .padding(.vertical, 4)
            .overlay(content: {
                VStack(content: {
                    Text(data.name)
                        .bold()
                        .font(.system(size: 30))
                        .padding(.vertical, 12)
                    Spacer()
                })
            })
            .offset(
                y: CGFloat(data.index) * (isExpandable ? 0 : -130)
            )
            .onTapGesture {
                withAnimation(.smooth(duration: 0.8, extraBounce: 0.2)) {
                    selectedCard = data
                    isCardDetailViewPresented = true
                }
            }
            .matchedGeometryEffect(id: data, in: animation)
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
