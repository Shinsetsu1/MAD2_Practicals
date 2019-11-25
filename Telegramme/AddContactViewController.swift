//
//  AddContactViewController.swift
//  Telegramme
//
//  Created by MAD2_P02 on 4/11/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var firstNameFld: UITextField!
    @IBOutlet weak var lastNameFld: UITextField!
    @IBOutlet weak var mobileFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
    }
    
    @IBAction func createBtn(_ sender: Any) {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.contactList.append(Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!))
//        print(String(appDelegate.contactList.endIndex-1))

        let controller = ContactController()
        controller.AddContact(newContact: Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!))
        
    }
    
}
