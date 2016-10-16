//
//  ViewController.swift
//  EventTracker
//
//  Created by Ankita Kalangutkar on 10/16/16.
//  Copyright © 2016 Ankita Kalangutkar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableContainerView: UIView!
    
    var events = [NSManagedObject]()
    var eventsModelArray = [EventModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatingEventModels()
        
        for event in eventsModelArray {
            saveEvent(event)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func creatingEventModels() {
        let event1 = EventModel(attributes:
            [
                "name":"Metallica Concert in Palace Grounds",
                "place":"Bangalore",
                "entryType":"Paid",
                "id":1
            ]
        )
        eventsModelArray.append(event1)
        
        let event2 = EventModel(attributes:
            [
                "name":"Saree Exhibition in Malleswaram Grounds",
                "place":"Bangalore",
                "entryType":"Free",
                "id":2
            ]
        )
        eventsModelArray.append(event2)
        
        let event3 = EventModel(attributes:
            [
                "name":"Wine tasting event in Links Brewery",
                "place":"Nasik",
                "entryType":"Paid",
                "id":3
            ]
        )
        eventsModelArray.append(event3)
        
        let event4 = EventModel(attributes:
            [
                "name":"Startups Meet in Kanteerava Indoor Stadium",
                "place":"Bangalore",
                "entryType":"Paid",
                "id":4
            ]
        )
        eventsModelArray.append(event4)
        
        let event5 = EventModel(attributes:
            [
                "name":"Summer Noon Party in Kumara Park",
                "place":"Bangalore",
                "entryType":"Paid",
                "id":5
            ]
        )
        eventsModelArray.append(event5)
        
        let event6 = EventModel(attributes:
            [
                "name":"Rock and Roll nights in Sarjapur Road",
                "place":"Bangalore",
                "entryType":"Paid",
                "id":6
            ]
        )
        eventsModelArray.append(event6)
        
        let event7 = EventModel(attributes:
            [
                "name":"Barbecue Fridays in Whitefield",
                "place":"Bangalore",
                "entryType":"Paid",
                "id":7
            ]
        )
        eventsModelArray.append(event7)
        
        let event8 = EventModel(attributes:
            [
                "name":"Summer workshop in Indiranagar",
                "place":"Bangalore",
                "entryType":"Free",
                "id":8
            ]
        )
        eventsModelArray.append(event8)
        
        let event9 = EventModel(attributes:
            [
                "name":"Impressions & Expressions in MG Road",
                "place":"Bangalore",
                "entryType":"Free",
                "id":9
            ]
        )
        eventsModelArray.append(event9)
        
        let event10 = EventModel(attributes:
            [
                "name":"Italian carnival in Electronic City",
                "place":"Bangalore",
                "entryType":"Free",
                "id":10
            ]
        )
        eventsModelArray.append(event10)
        
    }
    
    func saveEvent(eventModel:EventModel) {
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appdelegate.managedObjectContext
        let eventEntity = NSEntityDescription.entityForName("Events", inManagedObjectContext: managedContext)
        let event = NSManagedObject(entity: eventEntity!, insertIntoManagedObjectContext: managedContext)
        
        event.setValue(eventModel.name, forKey: "eventName")
        event.setValue(eventModel.id, forKey: "eventId")
        event.setValue(eventModel.place, forKey: "eventPlace")
        event.setValue(eventModel.entryType, forKey: "eventEntryType")
        
        do {
            try managedContext.save()
        }
        catch let error {
            print("Could not save \(error)")
        }
    }
    
}

