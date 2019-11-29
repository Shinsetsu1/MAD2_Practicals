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
    
    //Add a new contact to Core Data
    func AddContact(newContact:Contact){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CDContact", in: context)!
        
        let contact = NSManagedObject(entity: entity, insertInto: context)
        contact.setValue(newContact.firstName, forKeyPath: "firstname")
        contact.setValue(newContact.lastName, forKeyPath: "lastname")
        contact.setValue(newContact.mobileNo, forKey: "mobileno")
        
        do {
            try context.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    //Retrieve all contacts from Core Data
    func retrieveAllContact()->[Contact]{
        var contact:[NSManagedObject] = []
        
        var contactList: [Contact] = []
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        do {
            contact = try context.fetch(fetchRequest)
            
            for c in contact {
                let fname = c.value(forKeyPath: "firstname") as! String
                let lname = c.value(forKeyPath: "lastname") as! String
                let mnumber = c.value(forKeyPath: "mobileno") as! String
//                print("\(firstname!) \(lastname!), \(mobileno!)")
                let newContact = Contact(firstname: fname, lastname: lname, mobileno: mnumber)
                contactList.append(newContact)
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
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        let contactmobileno = newContact.mobileNo
        fetchRequest.predicate = NSPredicate(format:"mobileno = %@", contactmobileno)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            let obj = result[0]
            
            obj.setValue(newContact.firstName, forKeyPath: "firstname")
            obj.setValue(newContact.lastName, forKeyPath: "lastname")
            obj.setValue(newContact.mobileNo, forKeyPath: "mobileno")
            
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
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format:"mobileno = %@", mobileno)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            let obj = result[0]
            managedContext.delete(obj)
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func AddMessageToFriend(friend:Contact, message:Message){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let messageEntity = NSEntityDescription.entity(forEntityName: "CDMessage", in: context)!
        
        let cdMessage = NSManagedObject(entity: messageEntity, insertInto: context)
        cdMessage.setValue(message.date, forKey: "date")
        cdMessage.setValue(message.isSender, forKey: "isSender")
        cdMessage.setValue(message.text, forKey: "text")
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format: "lastname = %@", friend.lastName)
        do {
            let result = try context.fetch(fetchRequest)
            print("Added for \(result[0].value(forKeyPath: "lastname") as! String)")
            let cdContact = result[0]
            cdMessage.setValue(cdContact, forKey: "friend")
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func retrieveMessagesbyFriend(friend:Contact)->[Message]{
        var messageList:[Message] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CDMessage>(entityName: "CDMessage")
        
        fetchRequest.predicate = NSPredicate(format: "friend.lastname = %@", friend.lastName)
        do {
            let list:[NSManagedObject] = try context.fetch(fetchRequest)
            for message in list {
                let date = message.value(forKeyPath: "date") as! Date
                let isSender = message.value(forKeyPath: "isSender") as! Bool
                let text = message.value(forKeyPath: "text") as! String
                messageList.append(Message(messageDate: date, messageisSender: isSender, messageText: text))
            }
        } catch {
            print(error)
        }
        return messageList
    }
    
}
