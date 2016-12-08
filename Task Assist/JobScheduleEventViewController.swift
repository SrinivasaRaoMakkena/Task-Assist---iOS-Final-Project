//
//  JobScheduleViewController.swift
//  Task Assist
//
//  Created by Makkena,Srinivasa Rao on 11/14/16.
//  Copyright © 2016 Makkena,Srinivasa Rao. All rights reserved.
//

import UIKit

class JobScheduleEventViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var eventTitleTF: UITextField!
    
    
    
    @IBOutlet weak var monSwitch: UISwitch!
    
    
    @IBOutlet weak var tueSwitch: UISwitch!
    
    @IBOutlet weak var wedSwitch: UISwitch!
    
    
    
    @IBOutlet weak var thuSwitch: UISwitch!
    
    @IBOutlet weak var friSwitch: UISwitch!
    
    @IBOutlet weak var satSwitch: UISwitch!
    
    @IBOutlet weak var sunSwitch: UISwitch!
    
    
    @IBOutlet weak var jobStartTimeDatePicker: UIDatePicker!
    
    @IBOutlet weak var jobEndTimeDatePicker: UIDatePicker!
    
   
    var  strDate = ""
    var endDate = ""
   
    
    
    
    
    static var mondayEvents:[String] = []
    static var tuesdayEvents:[String] = []
    static var wednesdayEvents:[String] = []
    static var thursdayEvents:[String] = []
    static var fridayEvents:[String] = []
    static var saturdayEvents:[String] = []
    static var sundayEvents:[String] = []
    static var mondayJobTimeArray:[String] = []
    static var tuesdayJobTimeArray:[String] = []
    static var wednesdayJobTimeArray:[String] = []
    static var thursdayJobTimeArray:[String] = []
    static var fridayJobTimeArray:[String] = []
    static var satdayJobTimeArray:[String] = []
    static var sundayJobTimeArray:[String] = []
    
    @IBOutlet weak var classStartTimeDatePicker: UIDatePicker!
    
    
    @IBOutlet weak var classEndTimeDatePicker: UIDatePicker!
    
    
    func textFieldShouldReturn(textField:UITextField) -> Bool{
        //if(textField == self.topTF) —
        textField.resignFirstResponder()
        return true
    }
   
    class func tuesdayJobTimes() -> [Int]{
        var times:[Int] = []
        for i in tuesdayJobTimeArray{
            times.append(Int(i.componentsSeparatedByString(":")[0])!)
            
        }
        return times
        
    }

     
    
    
    
    @IBAction func monSwitchAction(sender: AnyObject) {
        if monSwitch.on{
            JobScheduleEventViewController.mondayEvents.append(eventTitleTF.text!)
            JobScheduleEventViewController.mondayJobTimeArray.append( "\(strDate) - \(endDate)")
            
        }
        
        
        
    }
    
    @IBAction func tueSwitchAction(sender: AnyObject) {
        if tueSwitch.on{
            
            JobScheduleEventViewController.tuesdayEvents.append(eventTitleTF.text!)
            JobScheduleEventViewController.tuesdayJobTimeArray.append( "\(strDate) - \(endDate)")
            
        }

        
    }
    
    
    @IBAction func wedSwitchAction(sender: AnyObject) {
        if wedSwitch.on{
            JobScheduleEventViewController.wednesdayEvents.append(eventTitleTF.text!)
            JobScheduleEventViewController.wednesdayJobTimeArray.append( "\(strDate) - \(endDate)")
        }
        
    }
    
    
    @IBAction func thuSwitchAction(sender: AnyObject) {
        if thuSwitch.on{
            
            JobScheduleEventViewController.thursdayEvents.append(eventTitleTF.text!)
            JobScheduleEventViewController.thursdayJobTimeArray.append( "\(strDate) - \(endDate)")
        
        }
        
        
    }
    
    
    @IBAction func friSwitchAction(sender: AnyObject) {
        if friSwitch.on{
            
           JobScheduleEventViewController.fridayEvents.append(eventTitleTF.text!)
            JobScheduleEventViewController.fridayJobTimeArray.append( "\(strDate) - \(endDate)")
        
        }
        
    }
    
    @IBAction func satSwitchAction(sender: AnyObject) {
        if satSwitch.on{
            
            JobScheduleEventViewController.saturdayEvents.append(eventTitleTF.text!)
            JobScheduleEventViewController.satdayJobTimeArray.append( "\(strDate) - \(endDate)")
            
        }
        
        
    }
    
    @IBAction func sunSwitchAction(sender: AnyObject) {
        if sunSwitch.on{
            
            JobScheduleEventViewController.sundayEvents.append(eventTitleTF.text!)
            JobScheduleEventViewController.sundayJobTimeArray.append( "\(strDate) - \(endDate)")
            
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
        self.navigationItem.title = "Job Schedule"
        if monSwitch.on{
            monSwitch.setOn(false, animated: true)
        }
        
        if tueSwitch.on{
            tueSwitch.setOn(false, animated: true)
        }
        if wedSwitch.on{
            wedSwitch.setOn(false, animated: true)
        }
        if thuSwitch.on{
            thuSwitch.setOn(false, animated: true)
        }
        if friSwitch.on{
            friSwitch.setOn(false, animated: true)
        }
        
        if satSwitch.on{
            satSwitch.setOn(false, animated: true)
        }
        if sunSwitch.on{
            sunSwitch.setOn(false, animated: true)
        }

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    
   
}
