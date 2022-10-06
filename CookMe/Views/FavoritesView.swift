//
//  FavoritesView.swift
//  CookMe
//
//  Created by Yurii on 27.09.2022.
//

import SwiftUI

struct FavoritesView: View {
    static let tag: String? = "Favorites"

    var body: some View {
        NavigationStack {
            VStack {
                Text("Your favorites will be displayed here.")
            }
            .navigationTitle("Favorites")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
