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
        let messageAlert = UIAlertController(title: "Empty Field", message: "Please populate the title and preparation time.", preferredStyle: .alert)
        
        messageAlert.addAction(UIAlertAction(title: "Noted", style: .default, handler: nil))
        
        self.present(messageAlert, animated: true)
    }
    
}
