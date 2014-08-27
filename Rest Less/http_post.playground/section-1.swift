import Foundation
import XCPlayground


func HTTPostJSON(url: String,
    jsonObj: AnyObject)
{
    
    var request = NSMutableURLRequest(URL: NSURL(string: url))
    var session = NSURLSession.sharedSession()
    
    var jsonError:NSError?
    request.HTTPMethod = "POST"
    request.HTTPBody = NSJSONSerialization.dataWithJSONObject( jsonObj, options: nil, error: &jsonError)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    var subTask = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
        
        var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
        println(response)
        var jsonRError: NSError?
        var json_response = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &jsonRError) as? NSDictionary
        println(jsonRError)
        jsonRError?
        if jsonRError? != nil {
            println(jsonRError!.localizedDescription)
        }
        else {
            json_response
        }
    })
    subTask.resume()
}

var params = ["workout_history":["workout_id":1, "user_id":10]] as Dictionary

HTTPostJSON("http://localhost:3000//workout_histories", params)

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)
