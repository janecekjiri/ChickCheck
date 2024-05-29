//
//  ChickCheckApp.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

@main
struct ChickCheckApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                DetailView(type: .new)
            }
//            TabView {
//                HomeView()
//                    .tabItem {
//                        Image(systemName: "house.fill")
//                        Text("tab_bunch")
//                    }
//                
//                StatisticsView()
//                    .tabItem {
//                        Image(systemName: "chart.bar.fill")
//                        Text("tab_stats")
//                    }
//            }
        }
    }
}
