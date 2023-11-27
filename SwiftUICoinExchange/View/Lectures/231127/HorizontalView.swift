//
//  HorizontalView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/27/23.
//

import SwiftUI

struct HorizontalView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<10) { item in
                HStack(spacing: 20) {
                    Text("Bitcoin \(item)")
                        .frame(width: 100)
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(Color.blue.opacity(0.4))
                        Text("₩ 10,032,021")
                    }
                    .frame(height: 60)
                }
            }
        }
    }
}

#Preview {
    HorizontalView()
}
