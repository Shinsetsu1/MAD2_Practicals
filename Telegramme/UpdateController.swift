//
//  UpdateController.swift
//  Telegramme
//
//  Created by MAD2_P02 on 18/11/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import UIKit

class UpdateController: UIViewController {
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var rowSelected: Int!
    var parentController: ShowContactViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let contact = appDelegate.contactList[rowSelected]
        
        let startFirstName = contact.firstName
        let startLastName = contact.lastName
        let startMobileNo = contact.mobileNo
        
        editFirstNameFld.text = startFirstName
        editLastNameFld.text = startLastName
        editMobileNoFld.text = startMobileNo
        
        print("\(rowSelected)/")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBOutlet weak var editFirstNameFld: UITextField!
    @IBOutlet weak var editLastNameFld: UITextField!
    @IBOutlet weak var editMobileNoFld: UITextField!
    @IBAction func saveBtn(_ sender: Any) {
        let updatedFirstName = editFirstNameFld.text
        let updatedLastName = editLastNameFld.text
        let updatedMobileNo = editMobileNoFld.text
        let contact = appDelegate.contactList[rowSelected]
        contact.firstName = updatedFirstName!
        contact.lastName = updatedLastName!
        contact.mobileNo = updatedMobileNo!
        self.navigationController?.popViewController(animated: true)
    }
}
