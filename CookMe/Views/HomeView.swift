//
//  HomeView.swift
//  CookMe
//
//  Created by Yurii on 27.09.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: DataController

    @State private var showingSheet = false

    static let tag: String? = "Home"

    var columns = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(vm.recipes) { recipe in
                        NavigationLink {
                            RecipeView(recipe: recipe)
                        } label: {
                            RecipeCard(recipe: recipe)
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
            .toolbar {
                Button {
                    showingSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingSheet) {
                NewRecipeView(vm: vm)
            }
            .environmentObject(DataController())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(DataController())
    }
}
