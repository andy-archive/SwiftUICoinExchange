//
//  HorizontalViewModel.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/27/23.
//

import Foundation

/* ObservableObject 프로토콜을 이용하여 관찰자 시점 적용 */
final class HorizontalViewModel: ObservableObject {
   
    @Published var time = 0.0 // View가 아니므로 @State가 아닌 @Published
    
    func timer() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            self.time += 0.5
        }
    }
}
