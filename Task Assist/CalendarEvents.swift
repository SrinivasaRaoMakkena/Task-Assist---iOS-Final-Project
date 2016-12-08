//
//  CalendarEvents.swift
//  Task Assist
//
//  Created by Thakkellapati,Meghana on 11/13/16.
//  Copyright © 2016 Makkena,Srinivasa Rao. All rights reserved.
//

import Foundation

class CalendarEvents{
    
    static var eventsArray:[String] = []
    static var dueDateArray:[String] = []
    static var originalDates:[String] = []
    
    static let token:String = "7438~SbwxWklDCgSYyE7ahvE9Hil3xnD5qp59Mj5bdDTy2Fsq7RKG7OsAmvr0CAlmA498"
        
    class func courses() {
        
        let url1 = "https://nwmissouri.instructure.com/api/v1/users/self/upcoming_events?access_token=\(token)"
      
        let session1:NSURLSession = NSURLSession.sharedSession()
        session1.dataTaskWithURL( NSURL(string: url1)!, completionHandler: processResults).resume()
    }
    
    class func processResults(data:NSData?,response:NSURLResponse?,error:NSError?)->Void {
        
        do {
            
            var jsonResult: [AnyObject]
            try jsonResult =  NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
            for event in jsonResult{
                
                let type = event["type"] as! String
                if type == "assignment"{
                    let assignment = event["assignment"]
                    let eventTitle =  event["title"]
                    eventsArray.append(eventTitle as! String)
                    
                    let dueDate = assignment!!["due_at"] as! String
                    originalDates.append(dueDate)
                    let dateFormatter:NSDateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                    let date:NSDate? = dateFormatter.dateFromString(dueDate)
                    
                    dateFormatter.dateFormat = "MMM dd YYYY, hh:mm a"
                    let dates = dateFormatter.stringFromDate(date!)
                    
                    dueDateArray.append(dates)
                
                    
                }
            }
        }
        catch {
            
        }
        
    }
}
