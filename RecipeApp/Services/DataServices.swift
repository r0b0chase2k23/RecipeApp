//
//  DataServices.swift
//  RecipeApp
//
//  Created by Robert Chase on 09/05/2022.
//

import Foundation

//  this swift file (call) is responsible for managing all the data fetching code of the app that fetches data from the json file and assigns it. by doinbg this it helps to keep orginaised and easier to maintain as more funtionality is added

class DataServices {
 static   func getLocalData() -> [Recipe]{
// here we get the file path for that json file to use to generate a file URL
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
// here we use a guard statment incase it returns nil
        guard pathString != nil else {
            return [Recipe]()
        }
// create a url object
        let url = URL(fileURLWithPath: pathString!)
        do{
           
// create or more acurately try to create a data object
         
            let data = try Data(contentsOf: url)

// decode the data with a JSON decoder
      
            let decoder = JSONDecoder()
            do{
        let recipeData = try decoder.decode([Recipe].self, from: data)
            
// here we assign a uuid to each new instance of recipeData created in the array
                for r in recipeData {
                    r.id = UUID()
// return the array of recipies with filled out blanks
                }
return recipeData
            }
            catch{
    // print error with parsing JSON
                print(error)
            }
            
        }
        catch{
          // Print Error with getting data to console
            print(error)
        }
// here we provide a catch all scenario if it fails to parse or retrive the data
            return [Recipe]()
    }

}
