//
//  ViewController.swift
//  Task Assist
//
//  Created by Makkena,Srinivasa Rao on 10/7/16.
//  Copyright © 2016 Makkena,Srinivasa Rao. All rights reserved.
//

import UIKit

class PrioritizedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var weekDay = WeekDayViewController()
    
    @IBOutlet weak var prioritizedTV: UITableView!
    
    var tuesdayTimes:[Int] = []
    var coursesGrades:[String:Double] = [:]
    var courses:[String] = []
    var grades:[Double] = []
    var importantEvents : [String] = []
    var timeLeft:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy, EEEE"
        
        self.navigationItem.title = "\(dateFormatter.stringFromDate(NSDate()))"
        
        coursesGrades = CoursesAndPercentages.coursePercentageDict
        
        tuesdayTimes.sortInPlace()
        
        suggestionsToStudent()
        
    }
    
    func fixTableViewInsets() {
        prioritizedTV.contentInset = UIEdgeInsetsZero
        prioritizedTV.scrollIndicatorInsets = UIEdgeInsetsZero
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        fixTableViewInsets()
    }
    
    func suggestionsToStudent(){
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let  today = dateFormatter.stringFromDate(NSDate())
        
        if today == "Tuesday"{
        }
        
        for i in 0 ..< CalendarEvents.dueDateArray.count{
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let date:NSDate? = dateFormatter.dateFromString(CalendarEvents.originalDates[i])
            
            importantEvents.append(CalendarEvents.eventsArray[i])
            
            if date!.timeIntervalSinceDate(NSDate())/3600 > 24{
                
                let remainingTime:Double = date!.timeIntervalSinceDate(NSDate()) % (3600*24)
                let remainderHour:Double = floor(((remainingTime)/3600))
                let remainderMin:Double = ceil((remainingTime % 3600)/60)
                
                timeLeft.append("\(floor(date!.timeIntervalSinceDate(NSDate())/(3600*24)))d\(remainderHour)h\(remainderMin)m left to submit")
                
                
                
            }else if (date!.timeIntervalSinceDate(NSDate())/(3600)) < 24 && (date!.timeIntervalSinceDate(NSDate())/60) > 60 {
                
                let remainingTime:Double = date!.timeIntervalSinceDate(NSDate()) % (3600*24)
                let remainderMin:Double = ceil((remainingTime % 3600)/60)
                timeLeft.append("\(floor(date!.timeIntervalSinceDate(NSDate())/3600))h\(remainderMin)m left to submit")
                
                
                
            }else{
                
                let remainingTime:Double = date!.timeIntervalSinceDate(NSDate()) % (3600*24)
                
                let remainderMin:Double = ceil((remainingTime % 3600)/60)
                
                timeLeft.append("\(remainderMin)m left to submit")
            }
            
        }
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return importantEvents.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        cell = tableView.dequeueReusableCellWithIdentifier("priority",forIndexPath: indexPath)
        cell.textLabel?.text = importantEvents[indexPath.row]
        cell.detailTextLabel?.text = timeLeft[indexPath.row]
        cell.imageView?.image = UIImage(named: "Date From-48.png")
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let back = UIBarButtonItem()
        back.title = "Back"
        navigationItem.backBarButtonItem = back
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    
    
}

