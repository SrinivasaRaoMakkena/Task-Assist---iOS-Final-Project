//
//  StudentDetailsViewController.swift
//  Task Assist
//
//  Created by Makkena,Srinivasa Rao on 10/7/16.
//  Copyright © 2016 Makkena,Srinivasa Rao. All rights reserved.
//

import UIKit
import Parse
import Bolts

class StudentDetailsViewController: UIViewController {
    
    var classDay: String = ""
    var mondayArray:[String] = []
    var tuesdayArray:[String] = []
    var wednesdayArray:[String] = []
    var thursdayArray:[String] = []
    var fridayArray:[String] = []
    var mondayTimeArray:[String] = []
     var tuesdayTimeArray:[String] = []
     var wednesdayTimeArray:[String] = []
     var thursdayTimeArray:[String] = []
     var fridayTimeArray:[String] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Student Details"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    //Method to transmit information from source view controller to destination view controller.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "job"{
            _ = segue.destinationViewController as! JobScheduleEventViewController
            
        }else{
            let destinationVC = segue.destinationViewController as! DetailsOfStudentViewController
            
            let arrayOfPercentages:[String] = CoursesAndPercentages.arrayOfPercentages
            if segue.identifier == "courses"{
                destinationVC.navigationItem.title = "Courses"
                destinationVC.arrayOfPercentage = arrayOfPercentages
                
            }else if segue.identifier == "exams"{
                destinationVC.navigationItem.title = "Exams"
                
                
            }
        }
        
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        
    }
    
   
    
    
    
}
