//
//  KWEventTrackedListViewController.swift
//  EventTracker
//
//  Created by Ankita Kalangutkar on 10/17/16.
//  Copyright © 2016 Ankita Kalangutkar. All rights reserved.
//

import UIKit
import CoreData

class KWEventTrackedListViewController: UITableViewController {
    var events = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateList:", name: "updateTrackingList", object: nil)
        
        tableView.tableFooterView = UIView()
    }
    
    func updateList(notification:NSNotification) {
        let dict = notification.object as! NSDictionary
        events = dict["eventsList"] as! [NSManagedObject]
        tableView.reloadData()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCellWithIdentifier("TrackedEventCell", forIndexPath: indexPath)
        let event = events[indexPath.row]
        customCell.textLabel?.text = event.valueForKey("eventName") as? String
        return customCell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            let event = events[indexPath.row]
            
            DatabaseManager.sharedManager.deleteEvent(event, completionHandler: { [weak self](success) -> Void in
                if success == true {
                    // completion
                    if let weakSelf = self {
                        weakSelf.events.removeAtIndex(indexPath.row)
                        weakSelf.tableView.reloadData()
                    }
                    
                }
                
            })

        }
    }
    
}
