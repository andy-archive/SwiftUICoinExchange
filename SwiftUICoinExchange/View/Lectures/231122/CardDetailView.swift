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
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(Color.random())
                    .frame(height: 150)
                    .padding(.horizontal)
                    .onTapGesture {
                        withAnimation(.bouncy(duration: 1.0)) {
                            isViewPresented = false
                        }
                    }
                    .matchedGeometryEffect(id: currentCard, in: animation)
                .padding(.vertical, 4)
                Text(currentCard.name)
                    .bold()
                    .font(.system(size: 30))
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
