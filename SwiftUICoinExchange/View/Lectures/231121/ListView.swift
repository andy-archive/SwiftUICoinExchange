//
//  ListView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/21.
//

import SwiftUI

struct ListView: View {
    
    init(viewModel: ListViewModel = ListViewModel()) {
        //        print("INIT ViewModel")
    }
    
    /* @ObservedObject vs @StateObject*/
    //    @StateObject var viewModel = ListViewModel()
    @ObservedObject var viewModel = ListViewModel()
    @State var randomNum = 0
    
    var body: some View {
        LazyVStack(spacing: 20) {
            Button(action: {
                viewModel.fetchAllMarket()
                print("FETCH")
            }, label: {
                Text("📡 서버 통신")
            })
            NavigationStack {
                ForEach(viewModel.marketList, id: \.self) { item in
                    NavigationLink(value: item) { // 🔥
                        HStack {
                            VStack(alignment: .leading) {
                                Button("RANDOM") {
                                    randomNum = Int.random(in: 1...100)
                                }
                                Text("\(randomNum)")
                                    .bold()
                                Text(item.koreanName)
                                    .bold()
                                    .foregroundStyle(.gray)
                                Text(item.englishName)
                                    .font(.caption)//📌.fontWeight(.caption)
                                    .foregroundStyle(.gray)
                            }
                            Spacer()
                            Text(item.market)
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                print("==============") // 어마어마한 과호출 발생
            }
        }
        .navigationDestination(for: Market.self) { item in
            let viewModel = HorizontalViewModel(market: item)
            HorizontalView(viewModel: viewModel)
        }
    }
}

#Preview {
    ListView()
}
