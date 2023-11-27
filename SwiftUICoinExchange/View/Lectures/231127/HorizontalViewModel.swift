//
//  HorizontalViewModel.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 11/27/23.
//

import Foundation

final class HorizontalViewModel: ObservableObject {
   
    @Published var time = 0.0
    
    func timer() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            self.time += 0.5
        }
    }
}
