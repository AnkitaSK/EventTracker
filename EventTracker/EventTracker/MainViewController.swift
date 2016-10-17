//
//  ViewController.swift
//  SlideNavigation
//
//  Created by Ankita Kalangutkar on 10/16/16.
//  Copyright © 2016 Ankita Kalangutkar. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var centerView: UIView!
    @IBOutlet var rightView: UIView!
    
    var centerVC: ViewController?
    var leftVC: LeftViewController?
    
    var showPanel:Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerVC = storyboard?.instantiateViewControllerWithIdentifier("ViewController") as? ViewController
        leftVC = storyboard?.instantiateViewControllerWithIdentifier("LeftViewController") as? LeftViewController
        
        let screenEdgePanGesture = UIScreenEdgePanGestureRecognizer(target: self, action:"handleEdgeSwipe:")
        screenEdgePanGesture.edges = UIRectEdge.Left
        view.addGestureRecognizer(screenEdgePanGesture)
    }
    
    func handleEdgeSwipe(gesture:UIScreenEdgePanGestureRecognizer) {
//        let velocity = gesture.velocityInView(gesture.view)
        moveToRight()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openSlider(sender: UIBarButtonItem) {
        moveToRight()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CenterSegue" {
            let navigationController:UINavigationController = (segue.destinationViewController as? UINavigationController)!
            for viewController in navigationController.viewControllers {
                if viewController.isKindOfClass(ViewController) {
                    centerVC = viewController as? ViewController
                    centerVC?.movePanel = {[weak self] movePanel in
                        if let weakSelf = self {
                            if weakSelf.showPanel == true {
                                weakSelf.moveToLeft()
                            }
                            else {
                                weakSelf.moveToRight()
                            }
                        }
                    }
                }
            }
            
        }
        if segue.identifier == "LeftSegue" {
            leftVC = segue.destinationViewController as? LeftViewController
        }
    }
    
    func moveToRight() {
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
            self.rightView.frame = CGRectMake(0, 0, 500, self.rightView.frame.size.height)
            self.centerView.frame = CGRectMake(500, self.centerView.frame.origin.y, self.centerView.frame.size.width,self.self.centerView.frame.size.height)
            }) { (finished) -> Void in
              self.showPanel = true
        }
    }
    
    func moveToLeft() {
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
            self.rightView.frame = CGRectMake(0, 0, 0, self.rightView.frame.size.height)
            self.centerView.frame = CGRectMake(0, self.centerView.frame.origin.y, self.centerView.frame.size.width,self.self.centerView.frame.size.height)
            }) { (finished) -> Void in
                self.showPanel = false
        }
    }

}

