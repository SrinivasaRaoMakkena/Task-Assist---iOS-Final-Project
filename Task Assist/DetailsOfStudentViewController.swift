//
//  CourseViewController.swift
//  Task Assist
//
//  Created by Makkena,Srinivasa Rao on 10/7/16.
//  Copyright © 2016 Makkena,Srinivasa Rao. All rights reserved.
//

import UIKit

class DetailsOfStudentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var arrayOfPercentage:[String] = []
    var percentages:[Double] = []
    var sortedCourses:[String] = []
    var arrayOfLetterGrades:[String] = []
    var coursePercentagesDictionary:[String:Double] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coursePercentagesDictionary = CoursesAndPercentages.coursePercentageDict
        
        for (k,v) in (Array(coursePercentagesDictionary).sort {$0.1 < $1.1}) {
            sortedCourses.append(k)
            percentages.append(v)
            
        }
        letterGrades()
        
            }
    
    
    func letterGrades() -> [String]{
        for percentage in percentages
        {
            
            if percentage < 60.0 {
                arrayOfLetterGrades.append("F")
            } else if percentage >= 60.0 && Double(percentage) < 70.0 {
                arrayOfLetterGrades.append("D")
            } else if percentage >= 70.0 && Double(percentage) < 80 {
                arrayOfLetterGrades.append("C")
            } else if percentage >= 80.0 && Double(percentage) < 90 {
                arrayOfLetterGrades.append("B")
            } else {
                arrayOfLetterGrades.append("A")
            }
        }
        return CoursesAndPercentages.arrayOfLetterGrades
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func fixTableViewInsets() {
        tableView.contentInset = UIEdgeInsetsZero
        tableView.scrollIndicatorInsets = UIEdgeInsetsZero
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        fixTableViewInsets()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoursesAndPercentages.arrayOfCourses.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        
       
        cell = tableView.dequeueReusableCellWithIdentifier("student")!
      
        
        cell.textLabel?.text = sortedCourses[indexPath.row]
        cell.detailTextLabel?.text = "\(percentages[indexPath.row]) (\(arrayOfLetterGrades[indexPath.row])) "
        cell.imageView?.image = UIImage(named: "Books-48.png")
        
        
        return cell
    }
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let courseScheduleVC = segue.destinationViewController as! CourseScheduleEventViewController
        
        let courseObject = sortedCourses[(tableView.indexPathForSelectedRow?.row)!]
        courseScheduleVC.course = courseObject 
        
    }
    
    
}
