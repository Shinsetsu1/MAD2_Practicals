//
//  ViewController.swift
//  Practical2
//
//  Created by MAD2_P02 on 21/10/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var friendList: [Friend] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Exercise 1
        let friend1 = Friend(firstname: "John", lastname: "Tan", age: 10)
        let friend2 = Friend(firstname: "Tom", lastname: "Lim", age: 16)
        let friend3 = Friend(firstname: "Jack", lastname: "Ong", age: 25)
        let friend4 = Friend(firstname: "Harry", lastname: "Ng", age: 43)
        let friend5 = Friend(firstname: "Wesley", lastname: "Qua", age: 5)
        
        friendList.append(friend1)
        friendList.append(friend2)
        friendList.append(friend3)
        friendList.append(friend4)
        friendList.append(friend5)
        
        //displayFriends()
//        displayFriendsUnder20()
    }
    
    // Exercise 2
//    func displayFriends() {
//        for friend in friendList {
//            print("Name: \(friend.firstName)\(friend.lastName), Age:\(friend.age)")
//        }
//    }
    
    // Exercise 3
//    func displayFriendsUnder20() {
//        for friend in friendList {
//            if (friend.age < 20) {
//                print("Name: \(friend.firstName)\(friend.lastName)")
//            }
//        }
//    }
    
    // Exercise 4
    func findAverageAge()->Double {
        var totalAge = 0
        var averageAge: Double
        for friend in friendList {
            totalAge += friend.age
            averageAge = Double(totalAge / friendList.count)
        }
        
    }


}

