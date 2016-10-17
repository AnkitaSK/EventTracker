//
//  KWEventGridViewController.swift
//  EventTracker
//
//  Created by Ankita Kalangutkar on 10/17/16.
//  Copyright © 2016 Ankita Kalangutkar. All rights reserved.
//

import UIKit
import CoreData

class KWEventGridViewController: UICollectionViewController {
    var events = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        events = DatabaseManager.sharedManager.fetchEvents()!
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let customCell:KWEventGridCell = collectionView.dequeueReusableCellWithReuseIdentifier("GridEventCell", forIndexPath: indexPath) as! KWEventGridCell
        let event = events[indexPath.row]
        customCell.gridEventNameLabel.text = event.valueForKey("eventName") as? String
        customCell.gridEventPlaceLabel.text = event.valueForKey("eventPlace") as? String
        customCell.gridEventTypeLabel.text = event.valueForKey("eventEntryType") as? String
        return customCell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
}
