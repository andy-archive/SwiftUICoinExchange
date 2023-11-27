//
//  MyTextField.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/27/23.
//

import SwiftUI

struct MyTextField: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.borderStyle = .line
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "제목을 입력해주세요"
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 15)
        return textField
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
