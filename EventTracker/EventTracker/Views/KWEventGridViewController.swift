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
        return 10
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let customCell:UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("GridEventCell", forIndexPath: indexPath)
        return customCell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
}
