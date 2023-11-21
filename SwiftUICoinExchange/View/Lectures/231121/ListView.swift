//
//  ListView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/21.
//

import SwiftUI

struct ListView: View {
    
    init(viewModel: ListViewModel = ListViewModel()) {
        print("============================")
    }
    
    /* @ObservedObject vs @StateObject*/
//    @StateObject var viewModel = ListViewModel()
    @ObservedObject var viewModel = ListViewModel()
    @State var randomNum = 0
    
    var body: some View {
        LazyVStack {
            Button("Server Complete") {
//                print("==============")
                viewModel.fetchAllMarket()
            }
            ForEach(viewModel.marketList, id: \.self) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Button("RANDOM") {
                            randomNum = Int.random(in: 1...100)
                        }
                        Text("\(randomNum)")
                            .bold()
                        Text(item.englishName)
                            .font(.caption)//📌.fontWeight(.caption)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    Text("BTC-KRW")
                }
                .padding()
            }
//            .onAppear {
//                print("==============") // 어마어마한 과호출 발생
//                viewModel.fetchAllMarket()
//            }
        }
    }
}
    
#Preview {
    ListView()
}
