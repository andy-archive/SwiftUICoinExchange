//
//  SesacView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/27/23.
//

import SwiftUI

struct SesacView: View {
    
    @State private var textFieldText = "TEST"
    
    var body: some View {
        VStack {
            Text(textFieldText) // 단순히 변경된 것을 렌더링
            TextField("THIS IS TextField", text: $textFieldText) // 값을 바꿔야 함 -> 화면에 반영
            MyTextField()
            MyWebView(url: "https://www.apple.com")
        }
    }
}

#Preview {
    SesacView()
}

/* 📌 Text(textFieldText) vs
 var body: some View {
     VStack {
         Text(textFieldText) // 📌 단순히 변경된 것을 렌더링만 한다 (데이터를 바꾸지는 않음)
         TextField("THIS IS TextField", text: $textFieldText) // 값을 바꿔야 함 -> 화면에 반영
         MyTextField()
         MyWebView(url: "https://www.apple.com")
     }
 }
 */
