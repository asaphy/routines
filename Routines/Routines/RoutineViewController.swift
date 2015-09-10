//
//  RoutineViewController.swift
//  Routines
//
//  Created by Asaph Yuan on 8/19/15.
//  Copyright © 2015 Asaph Yuan. All rights reserved.
//

import UIKit
import AVFoundation
import JWGCircleCounter

extension NSDate {
  func yearsFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(.Year, fromDate: date, toDate: self, options: []).year
  }
  func monthsFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(.Month, fromDate: date, toDate: self, options: []).month
  }
  func weeksFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(.WeekOfYear, fromDate: date, toDate: self, options: []).weekOfYear
  }
  func daysFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(.Day, fromDate: date, toDate: self, options: []).day
  }
  func hoursFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(.Hour, fromDate: date, toDate: self, options: []).hour
  }
  func minutesFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(.Minute, fromDate: date, toDate: self, options: []).minute
  }
  func secondsFrom(date:NSDate) -> Int{
    return NSCalendar.currentCalendar().components(.Second, fromDate: date, toDate: self, options: []).second
  }
  func offsetFrom(date:NSDate) -> String {
    if yearsFrom(date)   > 0 { return "\(yearsFrom(date))y"   }
    if monthsFrom(date)  > 0 { return "\(monthsFrom(date))M"  }
    if weeksFrom(date)   > 0 { return "\(weeksFrom(date))w"   }
    if daysFrom(date)    > 0 { return "\(daysFrom(date))d"    }
    if hoursFrom(date)   > 0 { return "\(hoursFrom(date))h"   }
    if minutesFrom(date) > 0 { return "\(minutesFrom(date))m" }
    if secondsFrom(date) > 0 { return "\(secondsFrom(date))s" }
    return ""
  }
}

class RoutineViewController: UIViewController {

  @IBOutlet weak var habitTimeLabel: UILabel!
  @IBOutlet weak var habitLabel: UILabel!

  let circleCounter = JWGCircleCounter(frame: CGRect(x: 85, y: 230, width: 150, height: 150))
  let localNotification: UILocalNotification = UILocalNotification()
  var currentTime: NSDate = NSDate()
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
      habitTime: 5,
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
  var audioPlayer: AVAudioPlayer!
  var first = true
  override func viewDidLoad() {
        super.viewDidLoad()
      doneButton.hidden = true

      taskCompletedButton.backgroundColor = UIColor.clearColor()
      taskCompletedButton.layer.cornerRadius = 10
      taskCompletedButton.layer.borderWidth = 1
      taskCompletedButton.layer.borderColor = UIColor.whiteColor().CGColor
      setNotification(data[task])
      populateView(data[task])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  @IBAction func cancelButton(sender: AnyObject) {
    myTimer!.invalidate()
    UIApplication.sharedApplication().cancelAllLocalNotifications()
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
      self.habitTimeLabel.text = getDifference(currentTime)
    }
    else if (first){
      self.habitTimeLabel.textColor = UIColor.redColor()
      self.habitTimeLabel.text = "Time's Up"
      do {
          try audioPlayer = AVAudioPlayer(contentsOfURL: NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("timer", ofType: "mp3")!), fileTypeHint:nil)
              audioPlayer.play()
        } catch {
          //Handle the error
        }
      first = false
    }
    else{
      
    }
  }
  
  func stringFromTimer(time:Int) -> String{
    let seconds = time % 60
    let minutes = (time / 60) % 60
    return String(format: "%0.1d:%0.2d", minutes, seconds)
  }
  
  func getDifference (var date:NSDate) -> String {
    date = NSDate()
    let seconds = localNotification.fireDate!.secondsFrom(date)
    return stringFromTimer(seconds)
  }

//  func stringFromTime(time:Int) -> String{
//    let seconds = time % 60
//    let minutes = (time / 60) % 60
//    return String(format: "%0.1d:%0.2d", minutes, seconds)
//  }
  
  func populateView(habit:Habit) -> () {
    self.view.backgroundColor = UIColor(patternImage: UIImage(named: habit.habitPic)!)
    self.habitLabel.text = habit.habitName
    self.habitTimeLabel.text = stringFromTimer(habit.habitTime-1)
    timer = habit.habitTime
    //current time
    currentTime = NSDate()
    getDifference(currentTime)
    myTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("countdown"), userInfo: nil, repeats: true)
    self.view.addSubview(circleCounter)
    circleCounter.startWithSeconds(habit.habitTime)
    circleCounter.circleColor = UIColor.whiteColor()
    circleCounter.circleBackgroundColor = UIColor(red:100/255.0, green:100/255.0, blue:100/255.0, alpha:0.5)
    circleCounter.circleTimerWidth = 1.0
  }
  
  func setNotification(habit:Habit) -> (){
    localNotification.alertAction = ""
    localNotification.alertBody = "Time's Up!"
    localNotification.fireDate = NSDate(timeIntervalSinceNow: Double(habit.habitTime))
    localNotification.soundName = UILocalNotificationDefaultSoundName // play default sound
    UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
  }
  
  func newHabit() -> (){
    task++
    UIApplication.sharedApplication().cancelAllLocalNotifications()
    first = true
    self.habitTimeLabel.textColor = UIColor.whiteColor()
    if(task < data.count){
      myTimer!.invalidate()
      myTimer = nil
      setNotification(data[task])
      populateView(data[task])
    }
    else{
      myTimer!.invalidate()
      self.habitTimeLabel.text = ""
      self.habitLabel.text = "Well Done!"
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
