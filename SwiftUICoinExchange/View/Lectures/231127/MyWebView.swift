//
//  MyWebView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/27/23.
//

import SwiftUI
import WebKit

/* 📌 UIViewRepresentable 프로토콜
 SwiftUI에 UIKit을 적용하기
 
 -> makeUIView & updateUIView
 
 📌 associatedtype
 꼭 지정할 필요는 없다
 
 typealias UIViewType = <#type#>
 
 */

struct MyWebView: UIViewRepresentable {
    
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let webView = WKWebView()
        let request = URLRequest(url: url)
        
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        
    }
}
