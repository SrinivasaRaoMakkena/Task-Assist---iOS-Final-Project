//
//  UpComingEventsViewController.swift
//  Task Assist
//
//  Created by Makkena,Srinivasa Rao on 10/7/16.
//  Copyright © 2016 Makkena,Srinivasa Rao. All rights reserved.
//

import UIKit

class UpComingEventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //Day object instantiation
    var courses:[String] = []
    var dueDates:[String] = []
    @IBOutlet weak var tableTV: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        courses = CalendarEvents.eventsArray
        dueDates = CalendarEvents.dueDateArray
        self.navigationItem.title = "Upcoming Events"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //method to display number of rows in section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
        
    }
    
    //method to display number of sections in table view
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Populating cell with its contents in table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell
        
        cell = tableView.dequeueReusableCellWithIdentifier("day",forIndexPath: indexPath)
        
        cell.textLabel?.text! = courses[indexPath.row]
        cell.detailTextLabel?.text! = dueDates[indexPath.row]
        cell.imageView?.image = UIImage(named: "Bomb With Timer-48.png")
        
        return cell
    }
    
    
}
