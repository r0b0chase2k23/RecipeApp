//
//  ContentView.swift
//  RecipeApp
//
//  Created by Robert Chase on 08/05/2022.
//

import SwiftUI

struct RecipeList: View {

// Refference to ViewModel
  @ObservedObject  var model = RecipeModel ()
    
    var body: some View {
        
        NavigationView{
        List(model.recipes) { r in
           
// Navigation Link to link views.
            NavigationLink(
                destination: RecipeDetailView(recipe:r), label: {
                HStack (spacing: 20.0) {
                Image(r.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipped()
                    .cornerRadius(5)
                VStack(alignment: .leading){
                
                    Text(r.name)
                    Text(r.origin)
                    
                      
                }
            }
            })
        }
        .navigationBarTitle("All Recipes")
        
        }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}
