//
//  RecipeModel.swift
//  RecipeApp
//
//  Created by Robert Chase on 09/05/2022.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
        }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
      
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num  != nil {
            // Get a single Serving size by multiplying denomenator by the recipe servings
            denominator *= recipeServings
            // get target portion my multiplying numerator by target servings
            numerator *= targetServings
            // reduce fractions by greatest common diviser
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            // Get whole portion if numerator > denominatior
            if numerator >= denominator {
                // calculate whole portion
                wholePortions = numerator / denominator
                // calculate remainer
                numerator = numerator % denominator
                // assign portion toi strings
                portion += String(wholePortions)
            }
            // Express remainder as a fraction
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : " "
                portion += "\(numerator) / \(denominator)"
            }
        }
        if var unit = ingredient.unit {
            // calcluate if whol portion is greater then 1
            if wholePortions > 1 {
            // calculate appropriate suffix
            if unit.suffix(2) == "ch" {
                unit += "es"
            }
                else if  unit.suffix(1) == "f" {
                   unit = String(unit.dropLast())
                   unit += "ves"
                }
                else {
                    unit += "s"
                }
        }
            portion +=  ingredient.num == nil && ingredient.denom == nil ? " " : " "
            
            return portion + unit
        }
        //return value
        return portion
    }
}
