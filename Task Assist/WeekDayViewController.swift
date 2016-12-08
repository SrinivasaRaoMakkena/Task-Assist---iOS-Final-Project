//
//  SundayViewController.swift
//  Task Assist
//
//  Created by Makkena,Srinivasa Rao on 10/7/16.
//  Copyright © 2016 Makkena,Srinivasa Rao. All rights reserved.
//

import UIKit
import Parse
import Bolts

class WeekDayViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var mondayCourses:[String] = []
    var tuesdayArray:[String] = []
    var wednesdayArray:[String] = []
    var thursdayArray:[String] = []
    var fridayArray:[String] = []
    
    var mondayCourseTimes:[String] = []
    var tuesdayTimeArray:[String] = []
    var wednesdayTimeArray:[String] = []
    var thursdayTimeArray:[String] = []
    var fridayTimeArray:[String] = []
    
    var weekDay:String!
    var sortedCourses:[String] = []
    var course:[Course]!
    var fetchedCourses:[String] = []
    var classDay:String!

    var daysArray:[String] = []
    var dateStrings:[String] = []
    var dictionary:[String:[String]] = [:]

    
    @IBOutlet weak var weekDayTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetch()
        
        
        
    }
    var alertController:UIAlertController!
    override func viewWillAppear(animated: Bool)
    {
        
        alertController = UIAlertController(title: nil, message: "Please wait\n\n", preferredStyle: UIAlertControllerStyle.Alert)
        
        let spinnerIndicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        
        spinnerIndicator.center = CGPointMake(135.0, 65.5)
        spinnerIndicator.color = UIColor.blackColor()
        spinnerIndicator.startAnimating()
        
        alertController.view.addSubview(spinnerIndicator)
        self.presentViewController(alertController, animated: false, completion: nil)
        weekDayTV.reloadData()
        
        
    }

    
    
    func fetch(){
        let query = PFQuery(className:"Course")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                for object in objects!{
                  
                    self.classDay = object["day"] as! String
                   
                    if self.classDay.containsString("Monday"){
                        self.mondayCourses = (object["course"] as! [String])
                        self.mondayCourseTimes = (object["time"] as! [String])
                        
                    }
                    if self.classDay.containsString("Tuesday"){
                        self.tuesdayArray = (object["course"] as! [String])
                        self.tuesdayTimeArray = (object["time"] as! [String])
                        
                    }
                    if self.classDay.containsString("Wednesday"){
                        self.wednesdayArray = (object["course"] as! [String])
                        self.wednesdayTimeArray = (object["time"] as! [String])
                    }
                    if self.classDay.containsString("Thursday"){
                        self.thursdayArray = (object["course"] as! [String])
                        self.thursdayTimeArray = (object["time"] as! [String])
                                            }
                    if self.classDay.containsString("Friday"){
                        self.fridayArray = (object["course"] as! [String])
                        self.fridayTimeArray = (object["time"] as! [String])
                        
                    }
                }
                
                self.weekDayTV.reloadData()
                self.alertController.dismissViewControllerAnimated(true, completion: nil)
            } else {
                
            }
        }
     
    }
    
        override func viewDidAppear(animated: Bool) {
        weekDayTV.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows = 0
        if section == 0{
            if weekDay == "Monday"{
                numberOfRows = mondayCourses.count
            }else if weekDay == "Tuesday"{
                numberOfRows = tuesdayArray.count
            }else if weekDay == "Wednesday"{
                numberOfRows = wednesdayArray.count
            }else if weekDay == "Thursday"{
                numberOfRows = thursdayArray.count
            }else if weekDay == "Friday" {
                numberOfRows = fridayArray.count
            }
            
        }else{
            
            if weekDay == "Monday"{
                numberOfRows = JobScheduleEventViewController.mondayEvents.count
            }else if weekDay == "Tuesday"{
                numberOfRows = JobScheduleEventViewController.tuesdayEvents.count
            }else if weekDay == "Wednesday"{
                numberOfRows = JobScheduleEventViewController.wednesdayEvents.count
            }else if weekDay == "Thursday"{
                numberOfRows = JobScheduleEventViewController.thursdayEvents.count
            }else if weekDay == "Friday"{
                numberOfRows = JobScheduleEventViewController.fridayEvents.count
            }else if weekDay == "Saturday"{
                numberOfRows = JobScheduleEventViewController.saturdayEvents.count
            }else{
                numberOfRows = JobScheduleEventViewController.sundayEvents.count
            }
            
            
            
        }
        return numberOfRows
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell
        cell = tableView.dequeueReusableCellWithIdentifier("weekday")!
        
        if indexPath.section == 0{
            
            if weekDay == "Monday"{
                
                
                cell.textLabel?.text = String(mondayCourses[indexPath.row])
              cell.detailTextLabel?.text = String(mondayCourseTimes[indexPath.row])
                
            }else if weekDay == "Tuesday"{
                cell.textLabel?.text = String(tuesdayArray[indexPath.row])
                cell.detailTextLabel?.text = String(tuesdayTimeArray[indexPath.row])
            }else if weekDay == "Wednesday"{
                cell.textLabel?.text = String(wednesdayArray[indexPath.row])
                cell.detailTextLabel?.text = String(wednesdayTimeArray[indexPath.row])
            }else if weekDay == "Thursday"{
                cell.textLabel?.text = String(thursdayArray[indexPath.row])
                cell.detailTextLabel?.text = String(thursdayTimeArray[indexPath.row])
            }else if weekDay == "Friday"{
                cell.textLabel?.text = String(fridayArray[indexPath.row])
                cell.detailTextLabel?.text = String(fridayTimeArray[indexPath.row])
            }
        }else{
            if weekDay == "Monday"{
                
                cell.textLabel?.text = String(JobScheduleEventViewController.mondayEvents[indexPath.row])
                cell.detailTextLabel?.text = String(JobScheduleEventViewController.mondayJobTimeArray[indexPath.row])
                
            }else if weekDay == "Tuesday"{
                cell.textLabel?.text = String(JobScheduleEventViewController.tuesdayEvents[indexPath.row])
                cell.detailTextLabel?.text = String(JobScheduleEventViewController.tuesdayJobTimeArray[indexPath.row])
            }else if weekDay == "Wednesday"{
                cell.textLabel?.text = String(JobScheduleEventViewController.wednesdayEvents[indexPath.row])
                cell.detailTextLabel?.text = String(JobScheduleEventViewController.wednesdayJobTimeArray[indexPath.row])
            }else if weekDay == "Thursday"{
                cell.textLabel?.text = String(JobScheduleEventViewController.thursdayEvents[indexPath.row])
                cell.detailTextLabel?.text = String(JobScheduleEventViewController.thursdayJobTimeArray[indexPath.row])
            }else if weekDay == "Friday"{
                cell.textLabel?.text = String(JobScheduleEventViewController.fridayEvents[indexPath.row])
                cell.detailTextLabel?.text = String(JobScheduleEventViewController.fridayJobTimeArray[indexPath.row])
            }else if weekDay == "Saturday"{
                cell.textLabel?.text = String(JobScheduleEventViewController.saturdayEvents[indexPath.row])
                cell.detailTextLabel?.text = String(JobScheduleEventViewController.satdayJobTimeArray[indexPath.row])
            }else{
                
                cell.textLabel?.text = String(JobScheduleEventViewController.sundayEvents[indexPath.row])
                cell.detailTextLabel?.text = String(JobScheduleEventViewController.sundayJobTimeArray[indexPath.row])
            }
            
            
        }
        return cell
    }
    //delete row
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if indexPath.section == 0{
            
            if editingStyle == UITableViewCellEditingStyle.Delete
            {
                
                
                if mondayCourses.count >= 1{
                    mondayCourses.removeAtIndex(indexPath.row)
                    weekDayTV.reloadData()
                    
                }else if CourseScheduleEventViewController.tuesdayCourses.count >= 1{
                    CourseScheduleEventViewController.tuesdayCourses.removeAtIndex(indexPath.row)
                    weekDayTV.reloadData()
                                    }else if CourseScheduleEventViewController.wednesdayCourses.count >= 1{
                    CourseScheduleEventViewController.wednesdayCourses.removeAtIndex(indexPath.row)
                    weekDayTV.reloadData()
                   
                }else if CourseScheduleEventViewController.thursdayCourses.count >= 1{
                    CourseScheduleEventViewController.thursdayCourses.removeAtIndex(indexPath.row)
                    weekDayTV.reloadData()
                   
                }else if CourseScheduleEventViewController.fridayCourses.count >= 1{
                    CourseScheduleEventViewController.fridayCourses.removeAtIndex(indexPath.row)
                    weekDayTV.reloadData()
                    
                }
                
                
            }
           
        }else{
            if editingStyle == UITableViewCellEditingStyle.Delete
            {
                if JobScheduleEventViewController.mondayEvents.count >= 1{
                    JobScheduleEventViewController.mondayEvents.removeAtIndex(indexPath.row)
                    weekDayTV.reloadData()
                    
                                    }else if JobScheduleEventViewController.tuesdayEvents.count >= 1{
                    JobScheduleEventViewController.tuesdayEvents.removeAtIndex(indexPath.row)
                    weekDayTV.reloadData()
                    
                   
                }else if JobScheduleEventViewController.wednesdayEvents.count >= 1{
                    JobScheduleEventViewController.wednesdayEvents.removeAtIndex(indexPath.row)
                    weekDayTV.reloadData()
                    
                   
                }else if JobScheduleEventViewController.thursdayEvents.count >= 1{
                    JobScheduleEventViewController.thursdayEvents.removeAtIndex(indexPath.row)
                    weekDayTV.reloadData()
                    
                   
                }else if JobScheduleEventViewController.fridayEvents.count >= 1{
                    JobScheduleEventViewController.fridayEvents.removeAtIndex(indexPath.row)
                    weekDayTV.reloadData()
                    
                   
                }else if JobScheduleEventViewController.saturdayEvents.count >= 1{
                    JobScheduleEventViewController.saturdayEvents.removeAtIndex(indexPath.row)
                    weekDayTV.reloadData()
                    
                    
                }else if JobScheduleEventViewController.sundayEvents.count >= 1{
                    JobScheduleEventViewController.sundayEvents.removeAtIndex(indexPath.row)
                    weekDayTV.reloadData()
                    
                                    }
                
            }
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label : UILabel = UILabel()
        if(section == 0){
            label.backgroundColor = UIColor.lightGrayColor()
            label.text = "Course Schedule"
            
        } else if (section == 1){
            label.backgroundColor = UIColor.lightGrayColor()
            label.text = "Job Schedule"
        }
        return label
    }
    
    
    
    
}
