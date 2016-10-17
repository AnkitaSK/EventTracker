//
//  LeftViewController.swift
//  SlideNavigation
//
//  Created by Ankita Kalangutkar on 10/16/16.
//  Copyright © 2016 Ankita Kalangutkar. All rights reserved.
//

import UIKit
import CoreData

class LeftViewController: UIViewController {
    var movePanelToOrigin:((event:NSManagedObject) ->Void)?
    
    var eventTrackingViewController:KWEventTrackedListViewController?
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        eventTrackingViewController = storyboard?.instantiateViewControllerWithIdentifier("KWEventTrackedListViewController") as? KWEventTrackedListViewController
        
        eventTrackingViewController!.tableView.frame = CGRectMake(0, 64, view.frame.size.width, view.frame.size.height)
        eventTrackingViewController?.movePanel = {[weak self] (moveToOrigin,event) in
            if let weakSelf = self {
                weakSelf.movePanelToOrigin!(event: event)
                
            }
        }
        view.addSubview((eventTrackingViewController?.view)!)
    }
}
