//
//  CenterViewController.swift
//  SlideNavigation
//
//  Created by Ankita Kalangutkar on 10/16/16.
//  Copyright © 2016 Ankita Kalangutkar. All rights reserved.
//

import UIKit

class CenterViewController: UIViewController {
    
    var movePanel:((movePanel:Bool) ->Void)?

    @IBAction func drawerButtonClicked(sender: UIBarButtonItem) {
        movePanel!(movePanel: true)
    }
}
