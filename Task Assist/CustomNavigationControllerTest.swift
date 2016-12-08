//
//  CustomNavigationControllerTest.swift
//  Task Assist
//
//  Created by Ehlers,Corey P on 11/12/16.
//  Copyright © 2016 Makkena,Srinivasa Rao. All rights reserved.
//

import UIKit

class CustomNavigationControllerTest: UINavigationController {
 
    override func viewWillAppear(animated: Bool) {
        self.popViewControllerAnimated(false)
    }
    
    override func viewWillDisappear(animated: Bool) {
        //debugPrint("Disappearing")
    }
}
