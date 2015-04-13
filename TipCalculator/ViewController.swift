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
        
        var billAmount = tipManager.billAmount
        var text = billAmount > 0 ? String(format: "%.2f", tipManager.billAmount) : String()
        
        billTextField.text = text
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
        tipManager.tipIndex = tipSegmentedControl.selectedSegmentIndex
        updateControls()
        animateMarioRight()
    }
    
    /// MARK: Animation
    
    @IBOutlet weak var marioImageView: UIImageView!
    @IBOutlet weak var marioHorizontalLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var marioVerticalLeadingConstraint: NSLayoutConstraint!

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
    
    func animateMarioRight() {
        var selectedIndex = CGFloat(tipSegmentedControl.selectedSegmentIndex)
        var segmentX = tipSegmentedControl.frame.minX
        var segmentWidth = tipSegmentedControl.frame.width / 3.0
        
        var marioWidth = marioImageView.frame.width
        var offset = (segmentWidth - marioWidth) / 2.0
        var marioX = CGFloat(segmentX + segmentWidth * selectedIndex + offset)
        
        marioImageView.alpha = 1.0
        marioImageView.hidden = false
        
        UIView.animateWithDuration(1.0, animations: {
            self.marioHorizontalLeadingConstraint.constant = marioX
            self.view.layoutIfNeeded()
            }, completion: { finished in
                self.animateMarioUp()
        })
    }
    
    func animateMarioUp() {
        var marioY = tipSegmentedControl.frame.maxY
        var oldMarioY = marioVerticalLeadingConstraint.constant
        
        UIView.animateWithDuration(0.5, animations: {
            self.marioVerticalLeadingConstraint.constant = marioY
            self.view.layoutIfNeeded()
            }, completion: { finished in
                self.marioVerticalLeadingConstraint.constant = oldMarioY
                self.fadeMarioOut()
        })
    }
    
    func fadeMarioOut() {
        UIView.animateWithDuration(1.0, animations: {
            self.marioImageView.alpha = 0.0
        })
    }
}

