//
//  WalletView.swift
//  SwiftUICoinExchange
//
//  Created by Taekwon Lee on 2023/11/20.
//

import SwiftUI

struct WalletView: View {
    
    @ObservedObject var viewModel = WalletViewModel()
    @State var renderingTestNumber = 0
    
    @available(iOS 17.0, *)
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("TEST: \(renderingTestNumber)")
                NavigationLink("BannerTest 화면", value: renderingTestNumber)
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(1..<5) { data in
                                bannerView()
                                    // iOS 17.0+ 디바이스 너비에 맞게 해결
                                    .containerRelativeFrame(.horizontal)
                                    .onTapGesture {
                                        viewModel.fetchBanner()
//                                        renderingTestNum = Int.random(in: 1...100)
                                    }
                            }
                        }
                        // 스크롤 하고자 하는 대상에 대한 레이아웃 설정
                        .scrollTargetLayout()
                        .safeAreaPadding([.horizontal], 12)
                        .scrollIndicators(.hidden)
                    }
                    .scrollTargetBehavior(.viewAligned)
                    ListView() // 하위뷰
                }
            }
            .scrollIndicators(.hidden)
            .refreshable { // iOS 15.0+
                viewModel.fetchBanner()
                renderingTestNumber = Int.random(in: 1...100)
            }
            .navigationTitle("My Wallet")
            .navigationDestination(for: Int.self) { item in
                BannerTestView(testNumber: $renderingTestNumber)
            }
        }
    }
    
    /* 컨테이너 뷰에 대한 좌표 및 크기에 접근 가능*/
    private func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let result = proxy.bounds(of: .scrollView)?.minX ?? 0 // 멈추려고 하는 위치 설정
        
        return -result
    }
    
    func bannerView() -> some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.yellow, .green]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .overlay {
                    Circle()
                        .fill(.blue.opacity(0.2))
                        .offset(x: 60, y: -60)
                        .scaleEffect(1.2, anchor: .topLeading) // 내부에서 옆으로 삐져 나온 것
                    Circle()
                        .fill(.blue.opacity(0.2))
                        .offset(x: 120)
                        .scaleEffect(1.2, anchor: .topLeading) // 내부에서 옆으로 삐져 나온 것
                }
                .clipShape(RoundedRectangle(cornerRadius: 25)) // 위에 overlay에 의해 튀어나온 부분을 잘라 냄
                .frame(maxWidth: .infinity)
                .frame(height: 150)
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 거래 현황")
                    .fontWeight(.light)
                Text(viewModel.banner.totalFormat)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
//            .visualEffect { content, geometryProxy in
//                content.offset(x: scrollOffset(geometryProxy))
//            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(8)
    }
}

#Preview {
    WalletView()
}

/* 📌 LazyVStack이 보이지 않는 이유
 -> 사실 보이지 않는 게 아니라 listView() 내부의 Spacer()에 의해
    잘려서 안 보이는 것이다
 -> 스크롤 지정 필요 -> embed ScrollView(.horizontal)
 */


/* 📌 viewWillAppear -> 생략
 .onAppear(perform: { // 화면이 뜰 때마다 호출
     /* VM func -> @escaping이 필요 없음
      - @ObservedObject viewModel 인스턴스
      - ObservableObject protocol 채택한 VM 클래스
      - @Published VM 클래스 저장 프로퍼티
      */
     viewModel.fetchAllMarket()
     
     /* escaping closures */
//                UpbitAPI.fetchAllMarket { market in
//                    viewModel.marketList = market
//                }
 })
 */
