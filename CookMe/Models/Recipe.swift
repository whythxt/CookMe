//
//  Recipe.swift
//  CookMe
//
//  Created by Yurii on 27.09.2022.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
}

struct Recipe: Codable, Identifiable {
    var id: String { name }
    var name: String
    var image: String?
    var description: String
    var ingredients: String
    var category: Category.RawValue

    static let example = Recipe(
        name: "Carrot Soup",
        image: "image1",
        description: "Best soup in the world",
        ingredients: "¼ cup cashews\n1 medium onion, cut into ½-inch dice (2 cups)\n1½ pounds carrots, cut into ½-inch dice (3½ cups)\n1 red bell pepper, peeled and cut into ½-inch dice (1 cup)\n1 sprig fresh rosemary\n1 sprig fresh thyme\n1 large fresh sage leaf\n4 cloves garlic, minced\n1 tablespoon lemon juice\nSea salt and freshly ground black pepper or cayenne pepper\n½ cup fresh pomegranate seeds\n2 tablespoons finely chopped fresh parsley",
        category: Category.soup.rawValue
    )
}
