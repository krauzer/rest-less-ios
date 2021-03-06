//
//  SecondViewController.swift
//  Rest Less
//
//  Created by Apprentice on 8/16/14.
//  Copyright (c) 2014 newts. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController, APIGetWorkoutControllerProtocol {
    
    

    var workoutTimer = NSTimer()
    var accumulatedTime = 0.0
    var startTimeDate: NSDate!
    @IBOutlet weak var displayWorkoutLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startWorkout (sender: AnyObject) {
        if workoutTimer.valid != true {
        let aSelector : Selector = "sumWorkoutTime"
        startTimeDate = NSDate(timeIntervalSinceReferenceDate: NSDate.timeIntervalSinceReferenceDate())
        workoutTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func stopWorkoutTime (sender: AnyObject) {
        workoutTimer.invalidate()
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                println("Swiped right")
            default:
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func getWorkout(sender: AnyObject) {
        
        
        var api = APIGetWorkoutController()
        api.delegate = self
        api.HTTPGetter("http://localhost:3000/workouts/1.json")
        
       
    }
    
    var response:NSDictionary?
    func receivedGetResponse(result: NSDictionary) -> NSDictionary {
        
        println(result)
        response = result
        println(response)
        return response!
    }
    
    
    
    func sumWorkoutTime() {
        accumulatedTime += workoutTimer.timeInterval


    }
    
  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
