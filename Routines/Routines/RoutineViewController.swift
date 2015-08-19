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
  
  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var taskCompletedButton: UIButton!
  @IBOutlet weak var skipButton: UIButton!
  struct Habit {
    var habitName: String
    var habitPic: String
    var habitCategory: String
    var habitTime: Int
  }
  
  let data = [
    Habit(habitName: "Water", habitPic: "water.png", habitCategory: "Physical", habitTime: 120),
    Habit(habitName: "7 Min Workout", habitPic: "water.png", habitCategory: "Physical", habitTime: 420)
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
      myTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("countdown"), userInfo: nil, repeats: true)
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
    let seconds = timer % 60
    let minutes = (timer / 60) % 60
    return String(format: "%0.2d:%0.2d", minutes, seconds)
  }
  
  func populateView(habit:Habit) -> () {
    self.view.backgroundColor = UIColor(patternImage: UIImage(named: habit.habitPic)!)
    self.habitLabel.text = habit.habitName
    timer = habit.habitTime
  }
  
  func newHabit() -> (){
    task++
    if(task < data.count){
      populateView(data[task])
    }
    else{
      myTimer!.invalidate()
      self.habitTimeLabel.text = ""
      self.habitLabel.text = "8 days in a row!"
      cancelButton.hidden = true
      skipButton.hidden = true
      taskCompletedButton.hidden = true
      doneButton.backgroundColor = UIColor.clearColor()
      doneButton.layer.cornerRadius = 10
      doneButton.layer.borderWidth = 1
      doneButton.layer.borderColor = UIColor.whiteColor().CGColor
      doneButton.hidden = false
      
    }
  }
  
  @IBAction func donePushed(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
