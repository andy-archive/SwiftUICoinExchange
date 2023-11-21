//
//  OverlayView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/21.
//

import SwiftUI

struct OverlayView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.yellow)
                    .frame(width: 150, height: 150)
                /* 따로 논다 -> 원을 벗어남 */
                Text("Hello. Nice to meet you.\nI am Andy.")
            }
            Circle()
                .fill(.yellow)
                .frame(width: 150, height: 150)
                .overlay { /* 영향을 받음 -> 원 내부에서만 적힘 */
                    Text("Hello. Nice to meet you.\nI am Andy.")
                }
        }
    }
}

#Preview {
    OverlayView()
}
