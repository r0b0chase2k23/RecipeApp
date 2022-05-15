//
//  RecipeTabView.swift
//  RecipeApp
//
//  Created by Robert Chase on 15/05/2022.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView{
            Text("Feature View")
                .tabItem{
                    VStack{
                        Image(systemName: "star.fill")
                        Text ("Featured")
                    }
                }
       RecipeList()
                .tabItem{
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
