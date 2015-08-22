//
//  ViewController.swift
//  Routines
//
//  Created by Asaph Yuan on 8/19/15.
//  Copyright © 2015 Asaph Yuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  struct GlobalVariables {
    static var yourVariable = 0
    static var data = NSUserDefaults.standardUserDefaults()
    static var timeSinceLastSuccess = 0
  }
  @IBOutlet weak var startMorningButton: UIButton!
  @IBOutlet weak var newRoutineButton: UIButton!
  @IBOutlet weak var editRoutineButton: UIButton!
  @IBOutlet weak var streakCountLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "homebackground.png")!)
    startMorningButton.backgroundColor = UIColor.clearColor()
    startMorningButton.layer.cornerRadius = 10
    startMorningButton.layer.borderWidth = 1
    startMorningButton.layer.borderColor = UIColor.whiteColor().CGColor
    
    newRoutineButton.backgroundColor = UIColor.clearColor()
    newRoutineButton.layer.cornerRadius = 5
    newRoutineButton.layer.borderWidth = 1
    newRoutineButton.layer.borderColor = UIColor.whiteColor().CGColor
    
    editRoutineButton.backgroundColor = UIColor.clearColor()
    editRoutineButton.layer.cornerRadius = 5
    editRoutineButton.layer.borderWidth = 1
    editRoutineButton.layer.borderColor = UIColor.whiteColor().CGColor

    if(!NSUserDefaults.standardUserDefaults().boolForKey("firstlaunch1.0")){
      //Put any code here and it will be executed only once.
      print("first")
      GlobalVariables.data.setInteger(0, forKey: "streakCount")
      NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstlaunch1.0")
    }
    GlobalVariables.yourVariable = GlobalVariables.data.integerForKey("streakCount")
    self.streakCountLabel.text = String(GlobalVariables.yourVariable)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "refresh:",name:"load", object: nil)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func refresh(notification: NSNotification){
    //load data here
    self.streakCountLabel.text = String(GlobalVariables.yourVariable)
  }


}

