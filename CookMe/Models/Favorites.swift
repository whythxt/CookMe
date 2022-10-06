//
//  Favorites.swift
//  CookMe
//
//  Created by Yurii on 06.10.2022.
//

import Foundation

class Favorites: ObservableObject {
    @Published var recipes: Set<String>
    private let saveKey = "Favorites"

    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            do {
                recipes = try JSONDecoder().decode(Set<String>.self, from: data)
                return
            } catch {
                recipes = []
            }
        }

        recipes = []
    }

    func contains(_ recipe: Recipe) -> Bool {
        recipes.contains(recipe.id)
    }

    func add(_ recipe: Recipe) {
        objectWillChange.send()
        recipes.insert(recipe.id)
        save()
    }

    func remove(_ recipe: Recipe) {
        objectWillChange.send()
        recipes.remove(recipe.id)
        save()
    }

    func save() {
        if let data = try? JSONEncoder().encode(recipes) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }
}
