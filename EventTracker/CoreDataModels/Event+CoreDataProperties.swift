//
//  Event+CoreDataProperties.swift
//  EventTracker
//
//  Created by Ankita Kalangutkar on 10/17/16.
//  Copyright © 2016 Ankita Kalangutkar. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Event {

    @NSManaged var eventEntryType: String?
    @NSManaged var eventId: NSNumber?
    @NSManaged var eventName: String?
    @NSManaged var eventPlace: String?

}
