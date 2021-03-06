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
    @IBOutlet weak var gridContainerView: UIView!
    
    var eventsModelArray = [EventModel]()
    
    
    var movePanel:((movePanel:Bool) ->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatingEventModels()
        
        for event in eventsModelArray {
            DatabaseManager.sharedManager.saveEvent(event)
        }

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "gotoDetailScreen:", name: "triggerDetailScreen", object: nil)
    }
    
    func gotoDetailScreen(notification:NSNotification) {
        let dict = notification.object as! NSDictionary
        let event = dict["event"] as! NSManagedObject
        
        let detailViewController:KWDetailViewController = (storyboard?.instantiateViewControllerWithIdentifier("KWDetailViewController") as? KWDetailViewController)!
        detailViewController.eventData = event
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    @IBAction func slideButtonClicked(sender: UIBarButtonItem) {
        movePanel!(movePanel: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func listViewButtonClicked(sender: UIButton) {
        view.bringSubviewToFront(tableContainerView)
    }
    
    @IBAction func gridViewButtonClicked(sender: UIButton) {
        view.bringSubviewToFront(gridContainerView)
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

    
}

