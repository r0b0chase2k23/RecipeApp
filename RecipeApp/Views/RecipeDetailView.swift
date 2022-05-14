//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by Robert Chase on 09/05/2022.
//

import SwiftUI

struct RecipeDetailView: View {
        
        var recipe:Recipe
  
    var body: some View {


        ScrollView{
      
            LazyVStack (alignment: .leading){
    // MARK: Image
            Image(recipe.image)
                .resizable()
                .scaledToFit()
              
    //MARK: Ingredients
            VStack(alignment: .leading){
                Text("Ingredient's:")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding([.leading, .bottom], 8.0)
                ForEach (recipe.ingredients, id:\.self) { item in Text("◉" + item)
                        .padding([.leading, .bottom], 3.0)
                        .padding(.leading, 5)
                }
            }
       
        Divider()
                
    //MARK: Directions
                                
            VStack (alignment: .leading){
            Text ("Directions")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding([.leading, .bottom], 8.0)
           
                ForEach(0..<recipe.directions.count, id: \.self) {
                index in
                Text(String(index+1) + ".) " + recipe.directions[index])
                        .padding(.bottom, 4)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                                
                            }
                                    
                }
                                
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
// here we create a dummy recipe and pass it into the detail view and pass in the data for our preview to buils a UI as its not generated by defualt
        let model = RecipeModel()

        
        RecipeDetailView(recipe: model.recipes[1])
}
}
