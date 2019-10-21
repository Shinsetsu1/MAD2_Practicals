//
//  Friend.swift
//  Practical2
//
//  Created by MAD2_P02 on 21/10/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import Foundation

class Friend {
    var firstName:String = ""
    var lastName:String = ""
    var age:Int = 0
    
    var description:String = ""
    init(firstname:String, lastname:String, age:Int) {
        self.firstName = firstname
        self.lastName = lastname
        self.age = age
    }
}
