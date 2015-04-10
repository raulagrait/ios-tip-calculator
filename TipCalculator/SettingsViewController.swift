//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Raul Agrait on 4/9/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController : UIViewController {
    
    @IBOutlet weak var smallTipTextField: UITextField!
    @IBOutlet weak var mediumTipTextField: UITextField!
    @IBOutlet weak var largeTipTextField: UITextField!
    
    lazy var tipManager: TipManager = AppDelegate.sharedInstance.tipManager
    
    override func viewDidLoad() {
    }
    
    @IBAction func onSmallTipChanged(sender: AnyObject) {
    }
    
    
    @IBAction func onMediumTipChanged(sender: AnyObject) {
    }
    
    
    @IBAction func onLargeTipChanged(sender: AnyObject) {
    }
}
