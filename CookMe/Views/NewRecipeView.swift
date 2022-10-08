//
//  NewRecipeView.swift
//  CookMe
//
//  Created by Yurii on 27.09.2022.
//

import PhotosUI
import SwiftUI

struct NewRecipeView: View {
    @Environment(\.dismiss) var dismiss

    @StateObject var pm = PhotosPickerModel()
    @ObservedObject var vm: DataController

    @State private var name = ""
    @State private var description = ""
    @State private var ingredients = ""
    @State private var category = "Main"

    var disabled: Bool {
        name.isEmpty || description.isEmpty || ingredients.isEmpty
    }

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $name)
            } header: {
                Text("Recipe")
            }

            Section {
                TextField("Description", text: $description)
                TextField("Ingredients", text: $ingredients)
            } header: {
                Text("Details")
            } footer: {
                Text("Separate your ingredients with \", \"  ")
            }

            Section {
                Picker("Type", selection: $category) {
                    ForEach(Category.allCases) { category in
                        Text(category.rawValue)
                    }
                }
            } header: {
                Text("Category")
            }

            Section {
                PhotosPicker(selection: $pm.selectedPhoto, matching: .any(of: [.images]), photoLibrary: .shared()) {
                    if pm.loadedImage == nil {
                        Image(systemName: "photo.fill")
                            .font(.callout)
                    } else {
                        Image(uiImage: pm.loadedImage!.image)
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                }
            } header: {
                Text("Image")
            }

            Section {
                Button("Save") {
                    let newRecipe = Recipe(
                        name: name,
                        image: pm.loadedImage?.image.base64,
                        description: description,
                        ingredients: ingredients.replacingOccurrences(of: ", ", with: "\n"),
                        category: category
                    )

                    vm.add(newRecipe)
                    dismiss()
                }
                .disabled(disabled)
            }
        }
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView(vm: DataController())
    }
}
