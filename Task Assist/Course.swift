//
//  Course.swift
//  Task Assist
//
//  Created by Makkena,Srinivasa Rao on 12/1/16.
//  Copyright © 2016 Makkena,Srinivasa Rao. All rights reserved.
//

import Foundation
import Parse
import Bolts



class Course:PFObject{
    @NSManaged var course:[String]!
    @NSManaged var time:[String]!
    @NSManaged var day:String
    
    init(day:String) {
        super.init()
        self.course = []
        self.time = []
        self.day = day
    }
    
    override init() {
        super.init()
    }
    
    override class func query() -> PFQuery? {
        
        let query = PFQuery(className: Course.parseClassName())
        
        query.includeKey("user")
        
        return query
    }
    
    class func queryWithDay(day:String) -> PFQuery? {
        let query = PFQuery(className: Course.parseClassName())
        query.whereKey("day", equalTo: day)
        return query
    }
}

extension Course : PFSubclassing {
    
    class func parseClassName() -> String {
        return "Course"
    }
}