//
//  BannerTestView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/21.
//

import SwiftUI

struct BannerTestView: View {
    
    @Binding var testNumber: Int
    
    var body: some View {
        Text("Test: \(testNumber)")
        Button("UPDATE") {
            testNumber = Int.random(in: 1...100)
        }
    }
}

#Preview {
    BannerTestView(testNumber: .constant(5))
}
