//
//  RecipeHighlights.swift
//  RecipeApp
//
//  Created by Robert Chase on 29/05/2022.
//

import SwiftUI

struct RecipeHighlights: View {
  
    var allHighlights = ""
    init(highlights:[String]){
        // Loop through highlights and build the String
        for index in 0..<highlights.count{
            // if last item dont add comma
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            }
            else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test2", "test3"])
    }
}
