//
//  AndyOrderBook.swift
//  AndyOrderBook
//
//  Created by Taekwon Lee on 11/29/23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    /* 📌 WidgetKit 최초로 렌더링 할 때 사용 -> 스켈레톤 뷰로 렌더링이 된다 */
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    /* 위젯 갤러리 안에 미리 보기 화면 */
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    /* 위젯 상태에 대한 변경 시점을 적용 */
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        /* 타임 라인의 마지막 날짜 이후 새로운 타임라인을 요청하도록 설정 */
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct AndyOrderBookEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("시간:")
            Text(entry.date, style: .time)

            Text("이모지:")
            Text(entry.emoji)
        }
    }
}

struct AndyOrderBook: Widget {
    let kind: String = "AndyOrderBook" // 📌 위젯의 고유한 문자열

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                AndyOrderBookEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                AndyOrderBookEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("보유 코인")
        .description("시세를 확인하세요 :)")
    }
}

#Preview(as: .systemSmall) {
    AndyOrderBook()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
