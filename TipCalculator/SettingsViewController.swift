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
        smallTipTextField.text = String(format: "%d", tipManager.smallTipInteger)
        mediumTipTextField.text = String(format: "%d", tipManager.mediumTipInteger)
        largeTipTextField.text = String(format: "%d", tipManager.largeTipInteger)
        
    }
    
    @IBAction func onSmallTipChanged(sender: AnyObject) {
        var smallTip: Int = (smallTipTextField.text as NSString).integerValue
        tipManager.smallTipInteger = smallTip
    }
    
    
    @IBAction func onMediumTipChanged(sender: AnyObject) {
        var mediumTip: Double = (mediumTipTextField.text as NSString).doubleValue / 100
        tipManager.mediumTipPercentage = mediumTip
    }
    
    
    @IBAction func onLargeTipChanged(sender: AnyObject) {
        var largeTip: Double = (largeTipTextField.text as NSString).doubleValue / 100
        tipManager.largeTipPercentage = largeTip
    }
}
