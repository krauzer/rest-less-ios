//
//  SecondViewController.swift
//  Rest Less
//
//  Created by Apprentice on 8/16/14.
//  Copyright (c) 2014 newts. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController, APIGetWorkoutControllerProtocol {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func getWorkout(sender: AnyObject) {
        
        var params = ["exercise_history":["weight":10, "reps":11,"rest_time":90, "distance":15, "running_time":400, "workout_history_id":3, "exercise_id":3]] as Dictionary
        HTTPostJSON("http://secret-stream-5880.herokuapp.com/exercise_histories",  params)
        
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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
