//
//  CategoryView.swift
//  CookMe
//
//  Created by Yurii on 27.09.2022.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var vm: DataController

    let category: Category

    var columns = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        NavigationStack {
            VStack {
                if vm.sort(category: category).isEmpty {
                        Text("Your favorite \(category.rawValue.lowercased() + "s") will be displayed here.")
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(vm.sort(category: category)) { recipe in
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
            .navigationTitle(category.rawValue + "s")
            .navigationBarTitleDisplayMode(.inline)
            .environmentObject(DataController())
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: .soup)
            .environmentObject(DataController())
    }
}
