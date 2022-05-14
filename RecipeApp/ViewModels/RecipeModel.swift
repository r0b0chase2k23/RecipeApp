//
//  RecipeModel.swift
//  RecipeApp
//
//  Created by Robert Chase on 09/05/2022.
//

import Foundation

// Here we create a variable to publish updated chganges to the Recipe Model to the UI

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        
// create an instance of the data service and get the data
//        let service = DataServices()
//        self.recipes = service.getLocalData()
// this code creates an instance of Data Services but by using the static function we can call on Data Services Directly
        self.recipes = DataServices.getLocalData()
        
    }
}
