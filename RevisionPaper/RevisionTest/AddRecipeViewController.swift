//
//  AddRecipeViewController.swift
//  RevisionTest
//
//  Created by MAD2_P02 on 4/12/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import Foundation
import UIKit

class AddRecipeViewController: UIViewController {
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtPreparationTime: UITextField!
    @IBOutlet weak var txtIngredient1: UITextField!
    @IBOutlet weak var txtIngredient2: UITextField!
    @IBOutlet weak var txtIngredient3: UITextField!
    @IBOutlet weak var txtIngredient4: UITextField!
    @IBOutlet weak var txtIngredient5: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnAdd(_ sender: Any) {
        if (txtTitle.text?.isEmpty ?? true) {
            let messageAlert = UIAlertController(title: "Empty Field", message: "Please populate the title and preparation time.", preferredStyle: .alert)
            
            messageAlert.addAction(UIAlertAction(title: "Noted", style: .default, handler: nil))
            
            self.present(messageAlert, animated: true)
        }
        else if (txtPreparationTime.text?.isEmpty ?? true) {
            let messageAlert = UIAlertController(title: "Empty Field", message: "Please populate the title and preparation time.", preferredStyle: .alert)
            
            messageAlert.addAction(UIAlertAction(title: "Noted", style: .default, handler: nil))
            
            self.present(messageAlert, animated: true)
        }
        else if (txtIngredient1.text?.isEmpty ?? true && txtIngredient2.text?.isEmpty ?? true && txtIngredient3.text?.isEmpty ?? true && txtIngredient4.text?.isEmpty ?? true && txtIngredient5.text?.isEmpty ?? true) {
            let messageAlert = UIAlertController(title: "Empty Field", message: "Please populate at least 1 ingredient field.", preferredStyle: .alert)
            
            messageAlert.addAction(UIAlertAction(title: "Noted", style: .default, handler: nil))
            
            self.present(messageAlert, animated: true)
        }
        else {
            let controller = RecipeController()
            controller.AddRecipe(newRecipe: Recipe(recipeTitle: txtTitle.text!, recipePrepTime: txtPreparationTime.text!))
            controller.AddIngredientToRecipe(recipe: Recipe(recipeTitle: txtTitle.text!, recipePrepTime: txtPreparationTime.text!), ingredient: Ingredient(recipeIngredients: txtIngredient1.text! + txtIngredient2.text! + txtIngredient3.text! + txtIngredient4.text! + txtIngredient5.text!))
            let messageAlert = UIAlertController(title: "Success", message: "New Recipe is successfully added!", preferredStyle: .alert)
            
            messageAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(messageAlert, animated: true)
        }
    }
    
}
