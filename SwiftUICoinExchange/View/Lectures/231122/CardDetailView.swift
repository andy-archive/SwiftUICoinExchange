//
//  CardDetailView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/22.
//

import SwiftUI

struct CardDetailView: View {
    
    @Binding var isViewPresented: Bool
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(Color.random())
                    .frame(height: 150)
                    .padding(.horizontal)
                    .onTapGesture {
                        isViewPresented.toggle()
                    }
                .padding(.vertical, 4)
                Text("Hello")
                    .bold()
                    .font(.system(size: 30))
                Spacer()
            }
        }
    }
}

#Preview {
    CardDetailView(isViewPresented: .constant(true))
}
