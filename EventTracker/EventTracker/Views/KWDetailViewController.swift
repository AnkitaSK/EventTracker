//
//  KWDetailViewController.swift
//  EventTracker
//
//  Created by Ankita Kalangutkar on 10/17/16.
//  Copyright © 2016 Ankita Kalangutkar. All rights reserved.
//

import UIKit
import CoreData

class KWDetailViewController: UIViewController {
    var eventData:NSManagedObject?
    @IBAction func trackEventButtonclicked(sender: UIButton) {
        
        DatabaseManager.sharedManager.saveEventForRelationship(eventData!) { (success) -> Void in
            if success == true {
               DatabaseManager.sharedManager.fetchRelationData()
            }
        }
        
    }
    
    
    
}
