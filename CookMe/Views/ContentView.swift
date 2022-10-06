//
//  ContentView.swift
//  CookMe
//
//  Created by Yurii on 27.09.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = DataController()
    @SceneStorage("selectedView") var selectedView: String?

    var body: some View {
        TabView(selection: $selectedView) {
            HomeView()
                .tag(HomeView.tag)
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            CategoriesView()
                .tag(CategoriesView.tag)
                .tabItem {
                    Label("Categories", systemImage: "list.bullet")
                }

            FavoritesView()
                .tag(FavoritesView.tag)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataController())
    }
}
