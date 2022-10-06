//
//  FavoritesView.swift
//  CookMe
//
//  Created by Yurii on 27.09.2022.
//

import SwiftUI

struct FavoritesView: View {
    static let tag: String? = "Favorites"

    @EnvironmentObject var vm: DataController
    @EnvironmentObject var favorites: Favorites

    var columns = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        NavigationStack {
            VStack {
                if favorites.recipes.isEmpty {
                    Text("Your favorites will be displayed here.")
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(vm.recipes) { recipe in
                                if favorites.contains(recipe) {
                                    NavigationLink {
                                        RecipeView(recipe: recipe)
                                    } label: {
                                        RecipeCard(recipe: recipe)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(DataController())
            .environmentObject(Favorites())
    }
}
