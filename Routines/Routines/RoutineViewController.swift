//
//  RoutineViewController.swift
//  Routines
//
//  Created by Asaph Yuan on 8/19/15.
//  Copyright © 2015 Asaph Yuan. All rights reserved.
//

import UIKit

class RoutineViewController: UIViewController {

  @IBOutlet weak var taskCompletedButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "water.png")!)
      taskCompletedButton.backgroundColor = UIColor.clearColor()
      taskCompletedButton.layer.cornerRadius = 10
      taskCompletedButton.layer.borderWidth = 1
      taskCompletedButton.layer.borderColor = UIColor.whiteColor().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  @IBAction func cancelButton(sender: AnyObject) {
    self.dismissViewControllerAnimated(false, completion: nil)
    
  }
  
  @IBAction func skipButton(sender: AnyObject) {
  }
  
}
