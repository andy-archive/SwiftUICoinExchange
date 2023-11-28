//
//  MyTextField.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/27/23.
//

import SwiftUI

struct MyTextField: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.borderStyle = .line
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "제목을 입력해주세요"
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 15)
        textField.text = text
        textField.delegate = context.coordinator // self면 오류 🔥 ERROR: Cannot assign value of type 'MyTextField' to type '(any UITextFieldDelegate)?'
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    // UIKit -> SwiftUI
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            
            text = textField.text ?? ""
            
            return true
        }
    }
}
