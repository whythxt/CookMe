//
//  RecipeCard.swift
//  CookMe
//
//  Created by Yurii on 27.09.2022.
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe

    @EnvironmentObject var favorites: Favorites

    var body: some View {
        ZStack {
            if recipe.image == nil {
                Image("image1")
            } else {
                Image(recipe.image!)
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(width: 150, height: 250)
        .blur(radius: recipe.image == nil ? 3 : 0)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .overlay(alignment: .bottom) {
            Text(recipe.name)
                .font(.headline)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 3)
                .padding(3)
        }
        .contextMenu {
            Button(favorites.contains(recipe) ? "Remove from Favorites" : "Add to Favorites") {
                if favorites.contains(recipe) {
                    favorites.remove(recipe)
                    favorites.save()
                } else {
                    favorites.add(recipe)
                    favorites.save()
                }
            }
        }
    }
}

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard(recipe: .example)
            .environmentObject(Favorites())
    }
}
