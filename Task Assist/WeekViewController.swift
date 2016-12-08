//
//  WeekViewController.swift
//  Task Assist
//
//  Created by Makkena,Srinivasa Rao on 10/7/16.
//  Copyright © 2016 Makkena,Srinivasa Rao. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let days:[String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let overrideDefaultColor:[String:UIColor] = ["Sunday":UIColor.redColor(), "Saturday":UIColor.redColor()]
    @IBOutlet weak var daysTableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Week Schedule"
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("day")!
        
        let dayLabel = cell.viewWithTag(1) as! UILabel
        dayLabel.text = days[indexPath.row]
        cell.imageView?.image = UIImage(named: "Today-45.png")
        if let overrideColor = overrideDefaultColor[days[indexPath.row]] {
            dayLabel.textColor = overrideColor
        }
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationVC = segue.destinationViewController as! WeekDayViewController
        
        let day = days[(daysTableView?.indexPathForSelectedRow?.row)!]
        
        
        
        destinationVC.navigationItem.title = day
        let backItem = UIBarButtonItem()
        backItem.title = "Week"
        navigationItem.backBarButtonItem = backItem
        destinationVC.weekDay = day
        
        
        
    }
    
    
    
}
