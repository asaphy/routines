//
//  RoutineViewController.swift
//  Routines
//
//  Created by Asaph Yuan on 8/19/15.
//  Copyright © 2015 Asaph Yuan. All rights reserved.
//

import UIKit
import JWGCircleCounter

class RoutineViewController: UIViewController {

  @IBOutlet weak var habitTimeLabel: UILabel!
  @IBOutlet weak var habitLabel: UILabel!

  let circleCounter = JWGCircleCounter(frame: CGRect(x: 85, y: 230, width: 150, height: 150))

  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var taskCompletedButton: UIButton!
  @IBOutlet weak var skipButton: UIButton!
  struct Habit {
    var habitName: String
    var habitPic: String
    var habitCategory: String
    var habitTime: Int
    var flexible: Bool
    var minSec: Int
  }
  
  let data = [
    Habit(
      habitName: "Water",
      habitPic: "water.png",
      habitCategory: "Physical",
      habitTime: 180,
      flexible: true,
      minSec: 60
    ),
    Habit(
      habitName: "7 Min Workout",
      habitPic: "water.png",
      habitCategory: "Physical",
      habitTime: 420,
      flexible: false,
      minSec: 420
    ),
    Habit(
      habitName: "Cold Shower",
      habitPic: "water.png",
      habitCategory: "Physical",
      habitTime: 420,
      flexible: true,
      minSec: 180
    ),
    Habit(
      habitName: "Brush/Floss",
      habitPic: "water.png",
      habitCategory: "Physical",
      habitTime: 180,
      flexible: true,
      minSec: 60
    ),
    Habit(
      habitName: "Meditate",
      habitPic: "water.png",
      habitCategory: "Spiritual",
      habitTime: 300,
      flexible: true,
      minSec: 60
    ),
    Habit(
      habitName: "Time with God",
      habitPic: "water.png",
      habitCategory: "Spiritual",
      habitTime: 1200,
      flexible: true,
      minSec: 300
    ),
    Habit(
      habitName: "Breakfast",
      habitPic: "water.png",
      habitCategory: "Physical",
      habitTime: 600,
      flexible: true,
      minSec: 300
    ),
    Habit(
      habitName: "Read",
      habitPic: "water.png",
      habitCategory: "Mental",
      habitTime: 900,
      flexible: true,
      minSec: 300
    ),
    Habit(
      habitName: "Morning Pages",
      habitPic: "water.png",
      habitCategory: "Mental",
      habitTime: 900,
      flexible: true,
      minSec: 180
    ),
    Habit(
      habitName: "Daily Goals",
      habitPic: "water.png",
      habitCategory: "Mental",
      habitTime: 300,
      flexible: true,
      minSec: 180
    )
  ]
  var timer = 0
  var task = 0
  var myTimer: NSTimer?
  
  override func viewDidLoad() {
        super.viewDidLoad()
      doneButton.hidden = true

      taskCompletedButton.backgroundColor = UIColor.clearColor()
      taskCompletedButton.layer.cornerRadius = 10
      taskCompletedButton.layer.borderWidth = 1
      taskCompletedButton.layer.borderColor = UIColor.whiteColor().CGColor
      populateView(data[task])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  @IBAction func cancelButton(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
    
  }
  
  @IBAction func skipButton(sender: AnyObject) {
    newHabit()
  }
  
  @IBAction func habitCompletedButton(sender: AnyObject) {
    newHabit()
  }
  @IBOutlet weak var doneButton: UIButton!
  func countdown() {
    if (timer > 0){
      timer--
      self.habitTimeLabel.text = stringFromTimer(timer)
    }
    else{
      self.habitTimeLabel.text = "Time's Up"
    }
  }
  
  func stringFromTimer(time:Int) -> String{
    let seconds = time % 60
    let minutes = (time / 60) % 60
    return String(format: "%0.1d:%0.2d", minutes, seconds)
  }
  
//  func stringFromTime(time:Int) -> String{
//    let seconds = time % 60
//    let minutes = (time / 60) % 60
//    return String(format: "%0.1d:%0.2d", minutes, seconds)
//  }
  
  func populateView(habit:Habit) -> () {
    self.view.backgroundColor = UIColor(patternImage: UIImage(named: habit.habitPic)!)
    self.habitLabel.text = habit.habitName
    self.habitTimeLabel.text = stringFromTimer(habit.habitTime)
    timer = habit.habitTime
    myTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("countdown"), userInfo: nil, repeats: true)
    self.view.addSubview(circleCounter)
    circleCounter.startWithSeconds(habit.habitTime)
    circleCounter.circleColor = UIColor.whiteColor()
    circleCounter.circleBackgroundColor = UIColor(red:100/255.0, green:100/255.0, blue:100/255.0, alpha:0.5)
    circleCounter.circleTimerWidth = 1.0
  }
  
  func newHabit() -> (){
    task++
    if(task < data.count){
      myTimer!.invalidate()
      myTimer = nil
      populateView(data[task])
    }
    else{
      myTimer!.invalidate()
      self.habitTimeLabel.text = ""
      self.habitLabel.text = "On with your day!"
      cancelButton.hidden = true
      skipButton.hidden = true
      circleCounter.hidden = true
      taskCompletedButton.hidden = true
      doneButton.backgroundColor = UIColor.clearColor()
      doneButton.layer.cornerRadius = 10
      doneButton.layer.borderWidth = 1
      doneButton.layer.borderColor = UIColor.whiteColor().CGColor
      doneButton.hidden = false
    }
  }
  
  @IBAction func donePushed(sender: AnyObject) {
    ViewController.GlobalVariables.yourVariable += 1
    ViewController.GlobalVariables.data.setInteger(ViewController.GlobalVariables.yourVariable, forKey: "streakCount")
    ViewController.GlobalVariables.timeSinceLastSuccess = 0
    NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
