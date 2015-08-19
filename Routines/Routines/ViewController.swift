//
//  ViewController.swift
//  Routines
//
//  Created by Asaph Yuan on 8/19/15.
//  Copyright © 2015 Asaph Yuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var startMorningButton: UIButton!
  @IBOutlet weak var newRoutineButton: UIButton!
  @IBOutlet weak var editRoutineButton: UIButton!
  
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
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

