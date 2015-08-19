//
//  RoutineViewController.swift
//  Routines
//
//  Created by Asaph Yuan on 8/19/15.
//  Copyright © 2015 Asaph Yuan. All rights reserved.
//

import UIKit

class RoutineViewController: UIViewController {

  @IBOutlet weak var habitTimeLabel: UILabel!
  @IBOutlet weak var habitLabel: UILabel!
  @IBOutlet weak var taskCompletedButton: UIButton!
  var timer = 0
    override func viewDidLoad() {
        super.viewDidLoad()
      
      
      struct Habit {
        var habitName: String
        var habitPic: String
        var habitCategory: String
        var habitTime: Int
      }
      
      let water = Habit(habitName: "Water", habitPic: "water.png", habitCategory: "Physical", habitTime: 120)
      self.view.backgroundColor = UIColor(patternImage: UIImage(named: water.habitPic)!)
      self.habitLabel.text = water.habitName
      timer = water.habitTime
      print(timer)
      _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("countdown"), userInfo: nil, repeats: true)


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
    self.dismissViewControllerAnimated(true, completion: nil)
    
  }
  
  @IBAction func skipButton(sender: AnyObject) {
  }
  
  func countdown() {
    print(timer)
    if (timer > 0){
      timer--
      self.habitTimeLabel.text = stringFromTimer(timer)
    }
    else{
      self.habitTimeLabel.text = "Time's Up"
    }
  }
  
  func stringFromTimer(time:Int) -> String{
    let seconds = timer % 60
    let minutes = (timer / 60) % 60
    return String(format: "%0.2d:%0.2d", minutes, seconds)
  }
  
}
