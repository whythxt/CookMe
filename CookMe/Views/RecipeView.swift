//
//  RecipeView.swift
//  CookMe
//
//  Created by Yurii on 27.09.2022.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                StretchingHeader {
//                    if recipe.image == nil {
//                        Image("image1")
//                            .resizable()
//                            .scaledToFill()
//
//                    } else {
//                        Image(recipe.image!)
//                            .resizable()
//                            .scaledToFill()
//                    }
                    Image("image1")
                        .resizable()
                        .scaledToFill()
                }
                .frame(height: 200)

                VStack(alignment: .leading) {
                    HStack {
                        Text(recipe.name)
                            .font(.largeTitle)
                            .bold()
                    }
                    .padding(.bottom, 1)
                    .padding(.top, 50)

                    HStack {
                        Text(recipe.description)
                    }

                    VStack(alignment: .leading) {
                        HStack {
                            Text("Ingredients")
                                .font(.title)
                                .fontWeight(.semibold)

                            Spacer()
                        }
                        .padding(.bottom, 3)

                        HStack {
                            Text(recipe.ingredients)
                            Spacer()
                        }
                    }
                    .frame(maxHeight: .infinity)
                }
                .padding(.leading, 5)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                }
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RecipeView(recipe: .example)
        }
    }
}
