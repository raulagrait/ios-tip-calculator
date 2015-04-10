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

        let billAmount = (billTextField.text as NSString).doubleValue
        let tipAmount = billAmount * 0.2
        let totalAmount = billAmount + tipAmount

        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
    }
}

