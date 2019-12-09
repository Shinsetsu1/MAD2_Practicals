//
//  RecipeController.swift
//  RevisionTest
//
//  Created by MAD2_P02 on 9/12/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import UIKit
import CoreData

class RecipeController {
     //Add a new recipe to Core Data
    func AddRecipe(newRecipe: Recipe){
            let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let entity = NSEntityDescription.entity(forEntityName: "CDRecipe", in: context)!
            
            let recipe = NSManagedObject(entity: entity, insertInto: context)
            recipe.setValue(newRecipe.title, forKeyPath: "name")
            recipe.setValue(newRecipe.prepTime, forKeyPath: "preparationTime")
            
            do {
                try context.save()
                
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
        
        //Retrieve all contacts from Core Data
    func retrieveAllRecipes()->[Recipe]{
        var recipe:[NSManagedObject] = []
        
        var recipeList: [Recipe] = []
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
        do {
            recipe = try context.fetch(fetchRequest)
            
            for r in recipe {
                let recipeTitle = r.value(forKeyPath: "name") as! String
                let recipePrepTime = r.value(forKeyPath: "preparationTime") as! String
    //          print("\(firstname!) \(lastname!), \(mobileno!)")
                let newRecipe = Recipe(recipeTitle: recipeTitle, recipePrepTime: recipePrepTime)
                recipeList.append(newRecipe)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return recipeList
    }
    
    func AddIngredientToRecipe(recipe:Recipe, ingredient:Ingredient){
          let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
          let context = appDelegate.persistentContainer.viewContext
          
          let ingredientEntity = NSEntityDescription.entity(forEntityName: "CDIngredient", in: context)!
          
          let cdIngredient = NSManagedObject(entity: ingredientEntity, insertInto: context)
          cdIngredient.setValue(ingredient.ingredientName, forKey: "name")
          
          let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
          fetchRequest.predicate = NSPredicate(format: "name = %@ AND preparationTime = %@", recipe.title, recipe.prepTime)
          do {
              let result = try context.fetch(fetchRequest)
              let cdRecipe = result[0]
              cdIngredient.setValue(cdRecipe, forKey: "recipes")
              try context.save()
          } catch {
              print(error)
          }
      }
      
      func retrieveIngredientsbyRecipe(recipe:[Recipe])->[Ingredient]{
          var ingredientList:[Ingredient] = []
          
          let appDelegate = UIApplication.shared.delegate as! AppDelegate
          let context = appDelegate.persistentContainer.viewContext
          let fetchRequest = NSFetchRequest<CDIngredient>(entityName: "CDIngredient")
          
        
        for r in recipe{
            fetchRequest.predicate = NSPredicate(format: "r.recipeTitle = %@ AND r.recipePrepTime = %@", r.title, r.prepTime)
            
            
        }
        for r in recipe {
            fetchRequest.predicate = NSPredicate(format: "r.recipeTitle = %@ AND r.recipePrepTime = %@", r.title, r.prepTime)
            do {
                let list:[NSManagedObject] = try context.fetch(fetchRequest)
                for i in list {
                    let ingredient = i.value(forKeyPath: "name") as! String
                    ingredientList.append(Ingredient(recipeIngredients: ingredient))
                }
            } catch {
                print(error)
            }
        }
        return ingredientList
      }
}
