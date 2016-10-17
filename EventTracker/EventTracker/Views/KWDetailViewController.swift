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
    @IBOutlet var eventNameLabel: UILabel!
    @IBOutlet var eventPlaceLabel: UILabel!
    @IBOutlet var eventTypeLabel: UILabel!
    
    @IBOutlet var eventTrackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventNameLabel.text = eventData!.valueForKey("eventName") as? String
        eventPlaceLabel.text = eventData!.valueForKey("eventPlace") as? String
        eventTypeLabel.text = eventData!.valueForKey("eventEntryType") as? String
        
        eventTrackButton.backgroundColor = UIColor.redColor()
        eventTrackButton.layer.cornerRadius = 5
        eventTrackButton.layer.borderWidth = 1
        eventTrackButton.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    @IBAction func trackEventButtonclicked(sender: UIButton) {
        
        DatabaseManager.sharedManager.saveEventForRelationship(eventData!) { (success) -> Void in
            if success == true {
               DatabaseManager.sharedManager.fetchRelationData()
            }
        }
        
    }
    
    
    
}
