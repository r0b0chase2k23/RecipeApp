//
//  RecipeFeaturedView.swift
//  RecipeApp
//
//  Created by Robert Chase on 24/05/2022.
//

import SwiftUI

struct RecipeFeaturedView: View {
  
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 1
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text ("Featured Recipes")
                .bold()
                .font(Font.custom("Avenir Heavy", size:32))
                .padding(.leading)
                .padding(.top, 40)
            GeometryReader { geo in
                TabView (selection: $tabSelectionIndex){
                    ForEach (0..<model.recipes.count, id:\.self) { index in
                        if model.recipes[index].featured == true {
                          //Recipe Card
                            Button(action: {
                                //Show Recipe Detail Sheet
                                self.isDetailViewShowing = true
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        
                                    VStack(spacing: 0){
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .font(Font.custom("Avenir Heavy", size:28))
                                            .padding(5)
                                    }
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing){
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100)
                            .cornerRadius(20)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y:5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time")
                    .font(Font.custom("Avenir Heavy", size:18))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size:18))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size:18))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
                    .font(Font.custom("Avenir", size:18))
            }
            .padding([.leading, .bottom])
        }.onAppear(perform: {
            setFeaturedIndex()
        })
    }
    func setFeaturedIndex() {
        // find index of first featured recipe
      let index =  model.recipes.firstIndex {
            (recipe) -> Bool in
            return recipe.featured
        }
            tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
