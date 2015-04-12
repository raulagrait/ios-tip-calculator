//
//  ViewController.swift
//  TipCalculator
//
//  Created by Raul Agrait on 4/9/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var billTextField: UITextField!

    @IBOutlet weak var totalLabel: UILabel!

    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    
    lazy var tipManager: TipManager = AppDelegate.sharedInstance.tipManager

    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.text = String(format: "%.2f", tipManager.billAmount)
        billTextField.becomeFirstResponder()
        updateControls()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        updateControls()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateControls()
    }

    @IBAction func onTapGestureRecognized(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onSegmentedControlValueChanged(sender: AnyObject) {
        tipManager.setTipIndex(tipSegmentedControl.selectedSegmentIndex)
        updateControls()
    }

    func updateControls() {
        tipManager.billAmount = (billTextField.text as NSString).doubleValue
        tipLabel.text = String(format: "$%.2f", tipManager.tipAmount)
        totalLabel.text = String(format: "$%.2f", tipManager.totalAmount)
        
        var smallTitle = "\(tipManager.smallTipInteger)%"
        tipSegmentedControl.setTitle(smallTitle, forSegmentAtIndex: 0)
        
        var mediumTitle = "\(tipManager.mediumTipInteger)%"
        tipSegmentedControl.setTitle(mediumTitle, forSegmentAtIndex: 1)
        
        var largeTitle = "\(tipManager.largeTipInteger)%"
        tipSegmentedControl.setTitle(largeTitle, forSegmentAtIndex: 2)
        
        tipSegmentedControl.selectedSegmentIndex = tipManager.tipIndex
    }
}

