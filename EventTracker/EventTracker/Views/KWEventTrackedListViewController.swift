//
//  KWEventTrackedListViewController.swift
//  EventTracker
//
//  Created by Ankita Kalangutkar on 10/17/16.
//  Copyright © 2016 Ankita Kalangutkar. All rights reserved.
//

import UIKit

class KWEventTrackedListViewController: UITableViewController {

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCellWithIdentifier("TrackedEventCell", forIndexPath: indexPath)
//        let event = events[indexPath.row]
//        customCell.textLabel?.text = event.valueForKey("eventName") as? String
        customCell.textLabel?.text = "Tracked event"
        return customCell
    }
    
}
