//
//  MovieLookupApp.swift
//  MovieLookup
//
//  Created by Joshna Priya Chiluvuri on 27/06/23.
//

import SwiftUI

@main
struct MovieLookupApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                DiscoverView()
                    .tabItem {
                        Image(systemName: "popcorn")
                    }
                DiscoverView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                    }
                DiscoverView()
                    .tabItem {
                        Image(systemName: "bookmark.fill")
                    }
            }
        }
    }
}
