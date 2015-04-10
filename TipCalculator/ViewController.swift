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

    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {

        var tipPercentages = [0.18, 0.20, 0.22]
        var tipPercentage = tipPercentages[tipSegmentedControl.selectedSegmentIndex]

        let billAmount = (billTextField.text as NSString).doubleValue
        let tipAmount = billAmount * tipPercentage
        let totalAmount = billAmount + tipAmount

        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
    }

    @IBAction func onTapGestureRecognized(sender: AnyObject) {
        view.endEditing(true)
    }
}

