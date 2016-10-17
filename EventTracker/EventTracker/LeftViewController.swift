//
//  LeftViewController.swift
//  SlideNavigation
//
//  Created by Ankita Kalangutkar on 10/16/16.
//  Copyright © 2016 Ankita Kalangutkar. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {
    
    var eventTrackingViewController:KWEventTrackedListViewController?
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        eventTrackingViewController = storyboard?.instantiateViewControllerWithIdentifier("KWEventTrackedListViewController") as? KWEventTrackedListViewController
        
        eventTrackingViewController!.tableView.frame = CGRectMake(0, 64, view.frame.size.width, view.frame.size.height)
        view.addSubview((eventTrackingViewController?.view)!)
    }
}
