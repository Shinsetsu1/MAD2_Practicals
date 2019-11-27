//
//  Message.swift
//  Telegramme
//
//  Created by MAD2_P02 on 27/11/19.
//  Copyright © 2019 MAD2_P02. All rights reserved.
//

import UIKit

class Message {
    
    var date:Date
    var isSender:Bool
    var text:String
    
    init(messageDate:Date, messageisSender:Bool, messageText:String) {
        date = messageDate
        isSender = messageisSender
        text = messageText
    }
}
