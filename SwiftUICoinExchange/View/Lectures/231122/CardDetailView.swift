//
//  CardDetailView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/22.
//

import SwiftUI

struct CardDetailView: View {
    
    @Binding var isViewPresented: Bool
    let currentCard: CardModel
    let animation: Namespace.ID
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                HStack {
                    HStack(alignment: .center, content: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.blue)
                            .padding()
                        Text("Back")
                            .foregroundStyle(.blue)
                        Spacer()
                    })
                    .onTapGesture {
                        withAnimation(.bouncy(duration: 1.0)) {
                            isViewPresented = false
                        }
                    }
                    Spacer()
                }
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(Color.random())
                    .frame(height: 150)
                    .padding(.horizontal)
                    .overlay(content: {
                        VStack(content: {
                            Text(currentCard.name)
                                .bold()
                                .font(.system(size: 30))
                                .padding(.vertical, 12)
                            Spacer()
                        })
                    })
                    .onTapGesture {
                        withAnimation(.bouncy(duration: 1.0)) {
                            isViewPresented = false
                        }
                    }
                    .matchedGeometryEffect(id: currentCard, in: animation)
                .padding(.vertical, 4)
                Spacer()
            }
        }
    }
}

//#Preview {
//    CardDetailView(
//        isViewPresented: .constant(true),
//    )
//}
