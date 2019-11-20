//
//  ContactController.swift
//  Telegramme
//
//  Created by MAD2_P02 on 20/11/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import UIKit
import CoreData

//Contact CRUD
class ContactController {
    
    @IBOutlet weak var editFirstNameFld: UITextField!
    @IBOutlet weak var editLastNameFld: UITextField!
    @IBOutlet weak var editMobileNoFld: UITextField!
    //Add a new contact to Core Data
    func AddContact(newContact:Contact){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CDContact", in: context)!
        
        let contact = NSManagedObject(entity: entity, insertInto: context)
        contact.setValue("Kheng", forKeyPath: "firstname")
        contact.setValue("Hin", forKeyPath: "lastname")
        contact.setValue("98219255", forKey: "mobileno")
        
        do {
            try context.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    //Retrieve all contacts from Core Data
    func retrieveAllContact()->[Contact]{
        var contact:[NSManagedObject] = []
        
        var contactList: [Contact]
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        do {
            contact = try context.fetch(fetchRequest)
            
            for c in contact {
                let firstname = c.value(forKeyPath: "firstname") as? String
                let lastname = c.value(forKeyPath: "lastname") as? String
                let mobileno = c.value(forKeyPath: "mobileno") as? String
                print("\(firstname!) \(lastname!), \(mobileno!)")
                let newContact = Contact(firstname: firstname ?? "", lastname: lastname ?? "", mobileno: mobileno ?? "")
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return contactList
    }
    
    //Update current contact with new contact
    //Fetch data based on mobileno
    func updateContact(mobileno:String, newContact:Contact){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDContact")
        let contactmobileno = newContact.mobileNo
        fetchRequest.predicate = NSPredicate(format:"mobileno = %@", contactmobileno)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            let obj = result[0] as! NSManagedObject
            
            obj.setValue(editFirstNameFld.text, forKeyPath: "firstname")
            obj.setValue(editLastNameFld.text, forKeyPath: "lastname")
            obj.setValue(editMobileNoFld.text, forKeyPath: "mobileno")
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                print ("Update error: \(error), \(error.userInfo)")
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    //Delete contact
    //Fetch data based on mobileno
    func deleteContact(mobileno:String){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format:"mobileno = %@", mobileno)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            let obj = result[0] as! NSManagedObject
            
            
        }
    }
    
}
