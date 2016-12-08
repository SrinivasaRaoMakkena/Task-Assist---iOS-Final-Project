//
//  CourcesAndPercentages.swift
//  Task Assist
//
//  Created by Ehlers,Corey P on 11/7/16.
//  Copyright © 2016 Makkena,Srinivasa Rao. All rights reserved.
//

import Foundation

class CoursesAndPercentages {
    static var arrayOfCourses:[AnyObject] = []
    static var arrayOfPercentages:[String] = []
    static var arrayOfLetterGrades:[String] = []
    static let token:String = "7438~SbwxWklDCgSYyE7ahvE9Hil3xnD5qp59Mj5bdDTy2Fsq7RKG7OsAmvr0CAlmA498"
    
    class func course() {
        let url = "https://canvas.instructure.com/api/v1/users/self/courses?access_token=\(token)&include[]=total_scores"
        let session:NSURLSession = NSURLSession.sharedSession()
        session.dataTaskWithURL( NSURL(string: url)!, completionHandler: processResultsCourse).resume()
        
    }
    
    
    static var coursePercentageDict:[String:Double]! = [:]

    
    class func processResultsCourse(data:NSData?,response:NSURLResponse?,error:NSError?)->Void {
        do {
            var jsonResult: [AnyObject]
            try jsonResult =  NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
          
            for course in jsonResult {
                
                let courseName:String = course["name"] as! String
                if course["course_code"] as! String != "NWOnline"{
                    arrayOfCourses.append(courseName)
                }
               
                let enrollment = course["enrollments"] as! NSArray
                
                for data in enrollment{
                    if String(data["computed_current_score"]) != "Optional(<null>)"{
                       
                        let str =  data["computed_current_score"]
                        
                        
                        arrayOfPercentages.append("\(str as! Double)")
                        
                        
                    }
                }
                
            }
            
            for i in 0 ..< arrayOfCourses.count{
                
                        CoursesAndPercentages.coursePercentageDict[arrayOfCourses[i] as! String] = Double(arrayOfPercentages[i])
                
                
            }
          
        }
        catch {
            
        }
    }
    
    
   class func letterGrades() -> [String]{
        for percentage in CoursesAndPercentages.arrayOfPercentages
        {
            
            if Double(percentage) < 60.0 {
                CoursesAndPercentages.arrayOfLetterGrades.append("F")
            } else if Double(percentage) >= 60.0 && Double(percentage) < 70.0 {
                CoursesAndPercentages.arrayOfLetterGrades.append("D")
            } else if Double(percentage) >= 70.0 && Double(percentage) < 80 {
                CoursesAndPercentages.arrayOfLetterGrades.append("C")
            } else if Double(percentage) >= 80.0 && Double(percentage) < 90 {
                CoursesAndPercentages.arrayOfLetterGrades.append("B")
            } else {
                CoursesAndPercentages.arrayOfLetterGrades.append("A")
            }
        }
        return CoursesAndPercentages.arrayOfLetterGrades
    }
    

}


//    class func calendar() {
//        let url = "https://canvas.instructure.com/api/v1/users/self/calendar_events?access_token=7438~SbwxWklDCgSYyE7ahvE9Hil3xnD5qp59Mj5bdDTy2Fsq7RKG7OsAmvr0CAlmA498"
//        let session:NSURLSession = NSURLSession.sharedSession()
//        session.dataTaskWithURL( NSURL(string: url)!, completionHandler: processResultsCalendar).resume()
//
//    }

/*
 https://nwmissouri.instructure.com/api/v1/calendar_events?context_codes[]=course_3229&type=assignment&all_events=true&access_token=7438~SbwxWklDCgSYyE7ahvE9Hil3xnD5qp59Mj5bdDTy2Fsq7RKG7OsAmvr0CAlmA498
 */

/*
 https://nwmissouri.instructure.com/api/v1/users/self/upcoming_events?access_token=7438~pTGdpE39MtNDPIhYMe2F7np9XkARvdS27WXmyuCacDxpJ4HUaCa9g55guHehCiO5
 */


