//
//  CourseScheduleEventViewController.swift
//  Task Assist
//
//  Created by Makkena,Srinivasa Rao on 11/14/16.
//  Copyright © 2016 Makkena,Srinivasa Rao. All rights reserved.
//

import UIKit
import Parse
import Bolts

class CourseScheduleEventViewController: UIViewController {
    
    var arrayOfClassStartDate:[String] = []
    
    @IBOutlet weak var monSwitch: UISwitch!
    
    @IBOutlet weak var tueSwitch: UISwitch!
    
    @IBOutlet weak var wedSwitch: UISwitch!
    
    @IBOutlet weak var thuSwitch: UISwitch!
    
    @IBOutlet weak var friSwitch: UISwitch!
    
    @IBOutlet weak var classStartTimeDatePicker: UIDatePicker!
    
    @IBOutlet weak var classEndTimeDatePicker: UIDatePicker!
    
    var  strDate = ""
    var endDate = ""
    
    var course:String = ""
    
    
    var daySelected:String!
    
    static var mondayCourses:[String] = []
    static var tuesdayCourses:[String] = []
    static var wednesdayCourses:[String] = []
    static var thursdayCourses:[String] = []
    static var fridayCourses:[String] = []
    static var mondayTimeArray:[String] = []
    static var tuesdayTimeArray:[String] = []
    static var wednesdayTimeArray:[String] = []
    static var thursdayTimeArray:[String] = []
    static var fridayTimeArray:[String] = []
    
    
    
    
    
    
    var count = 0
    static var mondayTimeIndex = 0
    static var tuesdayTimeIndex = 0
    static var wednesdayTimeIndex = 0
    static var thursdayTimeIndex = 0
    static var fridayTimeIndex = 0
 
    
    
    func updateParse(goodDay:String, gotTime:String){
        let myCourse = course
         
        let query = Course.queryWithDay(goodDay)
        query?.findObjectsInBackgroundWithBlock({ (course: [PFObject]?, error:NSError?) in
            if error == nil {
                if course?.count == 1 {
                        dispatch_async(dispatch_get_main_queue()) {
                            (course![0] as! Course).addObjectsFromArray([myCourse], forKey: "course")
                            (course![0] as! Course).addObjectsFromArray([gotTime], forKey: "time")
                            course![0].saveInBackground()
                        }
                    
                } else {
                    
                    let newCourse = Course(day: goodDay)
                    newCourse.course.append(myCourse)
                    newCourse.time.append(gotTime )
                    newCourse.saveInBackgroundWithBlock({ (success, error) -> Void in
                        if success {
                            
                        } else {
                            
                            if let error = error {
                                print("Something terrible happened. Something like \(error.localizedDescription)")
                            }
                        }
                    })
                }
            }
            
        })
        
    }

    
    
    @IBAction func monSwitchAction(sender: AnyObject) {
        if monSwitch.on{
            CourseScheduleEventViewController.mondayCourses.append(course)
            daySelected = "Monday"
            let monday = PFObject(className: "Course")
            var myTime:AnyObject!
            if CourseScheduleEventViewController.mondayTimeArray.count ==  0{
                CourseScheduleEventViewController.mondayTimeArray.append( "\(strDate) - \(endDate)")
                monday["time"] = CourseScheduleEventViewController.mondayTimeArray[0]
                myTime = monday["time"]
                
            }else{
                
               
                CourseScheduleEventViewController.mondayTimeArray.append( "\(strDate) - \(endDate)")
                CourseScheduleEventViewController.mondayTimeIndex += 1
                monday["time"] = CourseScheduleEventViewController.mondayTimeArray[CourseScheduleEventViewController.mondayTimeIndex]
                myTime = monday["time"]
                
                
            }
            
            updateParse(daySelected,gotTime:myTime as! String)
        }
        
    }
    
    
    
       @IBAction func tueSwitchAction(sender: AnyObject) {
        if tueSwitch.on{
            CourseScheduleEventViewController.tuesdayCourses.append(course)
            daySelected = "Tuesday"
            let tuesday = PFObject(className: "Course")
            var myTime:AnyObject!
            if CourseScheduleEventViewController.tuesdayTimeArray.count == 0{
                CourseScheduleEventViewController.tuesdayTimeArray.append( "\(strDate) - \(endDate)")
                tuesday["time"] = CourseScheduleEventViewController.tuesdayTimeArray[0]
                myTime = tuesday["time"]
                
            }else{
                CourseScheduleEventViewController.tuesdayTimeIndex += 1
                CourseScheduleEventViewController.tuesdayTimeArray.append( "\(strDate) - \(endDate)")
                tuesday["time"] = CourseScheduleEventViewController.tuesdayTimeArray[CourseScheduleEventViewController.tuesdayTimeIndex]
                myTime = tuesday["time"]
                
                
            }
            
            updateParse(daySelected,gotTime:myTime as! String)
            
            
        }
        
    }
    
    
    @IBAction func wedSwitchAction(sender: AnyObject) {
        if wedSwitch.on{
            CourseScheduleEventViewController.wednesdayCourses.append(course)
                    daySelected = "Wednesday"
            let wednesday = PFObject(className: "Course")
            var myTime:AnyObject!
            if CourseScheduleEventViewController.wednesdayTimeArray.count == 0{
                CourseScheduleEventViewController.wednesdayTimeArray.append( "\(strDate) - \(endDate)")
                wednesday["time"] = CourseScheduleEventViewController.wednesdayTimeArray[0]
                myTime = wednesday["time"]
                
            }else{
                CourseScheduleEventViewController.wednesdayTimeIndex += 1
                CourseScheduleEventViewController.wednesdayTimeArray.append( "\(strDate) - \(endDate)")
                wednesday["time"] = CourseScheduleEventViewController.wednesdayTimeArray[CourseScheduleEventViewController.wednesdayTimeIndex]
                myTime = wednesday["time"]
                
                
            }
            
            updateParse(daySelected,gotTime:myTime as! String)
            
        }
        
    }
    
    
    @IBAction func thuSwitchAction(sender: AnyObject) {
        if thuSwitch.on{
            CourseScheduleEventViewController.thursdayCourses.append(course)
            daySelected = "Thursday"
            let thursday = PFObject(className: "Course")
            var myTime:AnyObject!
            if CourseScheduleEventViewController.thursdayTimeArray.count == 0{
                CourseScheduleEventViewController.thursdayTimeArray.append( "\(strDate) - \(endDate)")
                thursday["time"] = CourseScheduleEventViewController.thursdayTimeArray[0]
                myTime = thursday["time"]
                
                
            }else{
               CourseScheduleEventViewController.thursdayTimeIndex += 1
                CourseScheduleEventViewController.thursdayTimeArray.append( "\(strDate) - \(endDate)")
                thursday["time"] = CourseScheduleEventViewController.thursdayTimeArray[CourseScheduleEventViewController.thursdayTimeIndex]
                myTime = thursday["time"]
            }
            
            updateParse(daySelected,gotTime:myTime as! String)
        }
        
    }
    
    @IBAction func friSwitchAction(sender: AnyObject) {
        
        if friSwitch.on{
            CourseScheduleEventViewController.fridayCourses.append(course)
            daySelected = "Friday"
            let friday = PFObject(className: "Course")
            var myTime:AnyObject!
            if CourseScheduleEventViewController.fridayTimeArray.count == 0{
                CourseScheduleEventViewController.fridayTimeArray.append( "\(strDate) - \(endDate)")
                friday["time"] = CourseScheduleEventViewController.fridayTimeArray[0]
                myTime = friday["time"]
                
            }else{
               CourseScheduleEventViewController.fridayTimeIndex += 1
                CourseScheduleEventViewController.fridayTimeArray.append( "\(strDate) - \(endDate)")
                friday["time"] = CourseScheduleEventViewController.fridayTimeArray[ CourseScheduleEventViewController.fridayTimeIndex]
                myTime = friday["time"]
            }
            
            updateParse(daySelected,gotTime:myTime as! String)
        }
        
    }
    
    
    @IBAction func startDatePickerAction(sender: AnyObject) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        strDate = dateFormatter.stringFromDate(classStartTimeDatePicker.date)
        
    }
    
    @IBAction func endDatePickerAction(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        endDate = dateFormatter.stringFromDate(classEndTimeDatePicker.date)
       
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.title = "Course Schedule"
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }
    
    func displayAlertWithTitle(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title:"OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert,animated:true, completion:nil)
    }
    
}
