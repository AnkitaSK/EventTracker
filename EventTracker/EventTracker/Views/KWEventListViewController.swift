//
//  KWEventListViewController.swift
//  EventTracker
//
//  Created by Ankita Kalangutkar on 10/16/16.
//  Copyright © 2016 Ankita Kalangutkar. All rights reserved.
//

import UIKit
import CoreData

class KWEventListViewController: UITableViewController {
    var events = [NSManagedObject]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appdelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName:"Event")
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest) as? [Event]
            events = results!
        }
        catch let error{
            print("Could not fetch \(error)")
        }
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCellWithIdentifier("EventListCell", forIndexPath: indexPath)
        let event = events[indexPath.row]
        customCell.textLabel?.text = event.valueForKey("eventName") as? String
        return customCell
    }

}
