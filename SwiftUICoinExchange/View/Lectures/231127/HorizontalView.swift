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
            ForEach(currencyDummy, id: \.id) { item in
                HStack(alignment: .center, spacing: 20) {
                    Text(item.name)
                        .frame(width: 100)
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(Color.blue.opacity(0.4))
                            .frame(width: 100)
                        Text(item.priceInUSD.formatted())
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