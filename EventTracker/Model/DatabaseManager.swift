//
//  DatabaseManager.swift
//  EventTracker
//
//  Created by Ankita Kalangutkar on 10/17/16.
//  Copyright © 2016 Ankita Kalangutkar. All rights reserved.
//

import UIKit
import CoreData

class DatabaseManager: NSObject {
    static let sharedManager:DatabaseManager = DatabaseManager()
    
    var eventData:NSManagedObject?
    let managedContext:NSManagedObjectContext?
    let appdelegate: AppDelegate?
    
    override init() {
        appdelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        managedContext = appdelegate!.managedObjectContext
    }
    
    func saveEvent(eventModel:EventModel) {
        
        managedContext!.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        let eventEntity = NSEntityDescription.entityForName("Event", inManagedObjectContext: managedContext!)
        let event = NSManagedObject(entity: eventEntity!, insertIntoManagedObjectContext: managedContext)
        
        event.setValue(eventModel.name, forKey: "eventName")
        event.setValue(eventModel.id, forKey: "eventId")
        event.setValue(eventModel.place, forKey: "eventPlace")
        event.setValue(eventModel.entryType, forKey: "eventEntryType")
        
        do {
            try managedContext!.save()
        }
        catch let error {
            print("Could not save \(error)")
        }
    }
    
    func fetchEvents() -> [NSManagedObject]? {
        var events = [NSManagedObject]()
        
        let fetchRequest = NSFetchRequest(entityName:"Event")
        
        do {
            let results = try managedContext!.executeFetchRequest(fetchRequest) as? [Event]
            events = results!
            return events
        }
        catch let error{
            print("Could not fetch \(error)")
        }
        
        return events
    }
    
    func deleteEvent(event:NSManagedObject,completionHandler:(success:Bool) -> Void) {
        managedContext!.deleteObject(event)
        do {
            try managedContext!.save()
            completionHandler(success: true)
        }
        catch let error {
            print("Could not delete \(error)")
        }
    }
    
    func saveEventForRelationship(eventData:NSManagedObject,completionHandler:(success:Bool) -> Void) {
        print(appdelegate!.user!.valueForKey("userName") as? String)
        let events = appdelegate!.user!.mutableSetValueForKey("events") 
        events.addObject(eventData)
        do {
            try managedContext!.save()
            completionHandler(success: true)
        }
        catch let error {
            print("Could not delete \(error)")
        }
        
    }
    
    func fetchRelationData() {
        print((appdelegate!.user?.valueForKey("userName")))
        if let userName = (appdelegate!.user?.valueForKey("userName")) {
            let fetchRequest = NSFetchRequest(entityName:"User")
            fetchRequest.predicate = NSPredicate(format: "userName ==%@","\(userName)")
            
            do {
                let results = try managedContext!.executeFetchRequest(fetchRequest) as? [User]
                let array = (results![0].valueForKey("events") as! NSSet).allObjects
                if array.count > 0 {
                    let myDict = ["eventsList": array]
                    NSNotificationCenter.defaultCenter().postNotificationName("updateTrackingList", object:myDict)
                }
            }
            catch let error{
                print("Could not fetch \(error)")
            }
        }
        
    }
}
