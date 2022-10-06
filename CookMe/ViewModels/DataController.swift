//
//  DataController.swift
//  CookMe
//
//  Created by Yurii on 29.09.2022.
//

import Foundation

class DataController: ObservableObject {
    @Published private(set) var recipes: [Recipe]

    let saveKey = "Recipes"

    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Recipe].self, from: data) {
                recipes = decoded
                return
            }
        }

        recipes = []
    }

    func sort(category: Category) -> [Recipe] {
        switch category {
            case .breakfast:
                return recipes.filter { $0.category == "Breakfast" }
            case .soup:
                return recipes.filter { $0.category == "Soup" }
            case .salad:
                return recipes.filter { $0.category == "Salad" }
            case .appetizer:
                return recipes.filter { $0.category == "Appetizer" }
            case .main:
                return recipes.filter { $0.category == "Main" }
            case .side:
                return recipes.filter { $0.category == "Side" }
            case .dessert:
                return recipes.filter { $0.category == "Dessert" }
            case .snack:
                return recipes.filter { $0.category == "Snack" }
            case .drink:
                return recipes.filter { $0.category == "Drink" }
        }
    }

    func add(_ item: Recipe) {
        DispatchQueue.main.async {
            self.recipes.append(item)
        }

//        save()
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(recipes) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
}
