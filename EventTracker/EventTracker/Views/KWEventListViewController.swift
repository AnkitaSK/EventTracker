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
        
        events = DatabaseManager.sharedManager.fetchEvents()!
        
        tableView.tableFooterView = UIView()
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

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let event = events[indexPath.row]
        
        let detailViewController:KWDetailViewController = (storyboard?.instantiateViewControllerWithIdentifier("KWDetailViewController") as? KWDetailViewController)!
        detailViewController.eventData = event
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
