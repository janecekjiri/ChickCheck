//
//  ChickCheckApp.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

@main
struct ChickCheckApp: App {
    @ObservedObject var recordStore = RecordStore()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView().environmentObject(recordStore)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("tab_bunch")
                    }
                
                StatisticsView(details: recordStore.recordsExternal)
                    .tabItem {
                        Image(systemName: "chart.bar.fill")
                        Text("tab_stats")
                    }
            }
        }
    }
}
