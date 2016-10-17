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
    var eventsModelArray = [EventModel]()
    var alert:UIAlertController?
    
    var movePanel:((movePanel:Bool) ->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatingEventModels()
        
        for event in eventsModelArray {
            saveEvent(event)
        }
        
//        addName()
    }

    @IBAction func slideButtonClicked(sender: UIBarButtonItem) {
        movePanel!(movePanel: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addName () {
        alert = UIAlertController(title: "Enter your Name", message: "", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "Save",
            style: .Default,
            handler: { (action:UIAlertAction) -> Void in
                
                let textField = self.alert!.textFields!.first
                self.saveUser((textField?.text)!)
                
        })
        
        alert!.addTextFieldWithConfigurationHandler { (textField:UITextField) -> Void in
            textField.addTarget(self, action: "textChanged:", forControlEvents: .EditingChanged)
        }
        
        
        alert!.addAction(saveAction)
        (alert!.actions[0] as UIAlertAction).enabled = false
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.presentViewController(self.alert!, animated: true, completion: nil)
        })
        
    }
    
    func textChanged(sender:AnyObject) {
        let textField = sender as! UITextField
        var responder:UIResponder = textField
        while !(responder is UIAlertController) {
            responder = responder.nextResponder()!
        }
        let alert = responder as! UIAlertController
//        saveUser((textField.text)!)
        (alert.actions[0] as UIAlertAction).enabled = (textField.text != "" && textField.text?.characters.count > 3)
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
    
    func saveUser(name:String) {
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appdelegate.managedObjectContext
//        managedContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        let userEntity = NSEntityDescription.entityForName("User", inManagedObjectContext: managedContext)
        let user = NSManagedObject(entity: userEntity!, insertIntoManagedObjectContext: managedContext)
        
        user.setValue(name, forKey: "userName")
        
        do {
            try managedContext.save()
        }
        catch let error {
            print("Could not save \(error)")
//            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                self.alert?.message = "Name already exists,Enter different name"
//                self.presentViewController(self.alert!, animated: true, completion: nil)
//            })
            
        }

    }
    
    func saveEvent(eventModel:EventModel) {
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appdelegate.managedObjectContext
        managedContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        let eventEntity = NSEntityDescription.entityForName("Event", inManagedObjectContext: managedContext)
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

