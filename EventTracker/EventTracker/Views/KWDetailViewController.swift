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
        print(eventData?.valueForKey("eventName") as? String)
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        print(appdelegate.user!.valueForKey("userName") as? String)
        let events = appdelegate.user?.valueForKeyPath("events") as? NSMutableSet
        events?.addObject(eventData!)
        
        fetchRelationData()
    }
    
    func fetchRelationData() {
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appdelegate.managedObjectContext
        print((appdelegate.user?.valueForKey("userName")))
        if let userName = (appdelegate.user?.valueForKey("userName")) {
            let fetchRequest = NSFetchRequest(entityName:"User")
            fetchRequest.predicate = NSPredicate(format: "userName ==%@","\(userName)")
            
            do {
                let results = try managedContext.executeFetchRequest(fetchRequest) as? [User]
                let array = (results![0].valueForKey("events") as! NSSet).allObjects
                print(array)
                
                let myDict = ["eventsList": array]
                NSNotificationCenter.defaultCenter().postNotificationName("updateTrackingList", object:myDict);
            }
            catch let error{
                
                print("Could not fetch \(error)")
            }
        }
        
    }
    
    
}
