//
//  SesacView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/27/23.
//

import SwiftUI

struct SesacView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            MyWebView(url: "https://www.apple.com")
        }
    }
}

#Preview {
    SesacView()
}
