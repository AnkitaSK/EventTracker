//
//  EventModel.swift
//  EventTracker
//
//  Created by Ankita Kalangutkar on 10/16/16.
//  Copyright © 2016 Ankita Kalangutkar. All rights reserved.
//

import UIKit

class EventModel: NSObject {
    var name:String?
    var place:String?
    var entryType:String?
    var id:NSInteger?
    
    override init() {
        super.init()
    }
    
    convenience init(attributes:[String:AnyObject]) {
        self.init()
        id = attributes["id"] as? NSInteger ?? 0
        name = attributes["name"] as? String ?? ""
        place = attributes["place"] as? String ?? ""
        entryType = attributes["entryType"] as? String ?? ""
    }
}
