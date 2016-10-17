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
//        customCell.textLabel?.text = "Tracked event"
        return customCell
    }
    
}
