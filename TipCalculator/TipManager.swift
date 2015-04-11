//
//  TipManager.swift
//  TipCalculator
//
//  Created by Raul Agrait on 4/9/15.
//  Copyright (c) 2015 rateva. All rights reserved.
//

import Foundation

enum Tip: Int {
    case SmallTip = 0
    case MediumTip = 1
    case LargeTip = 2
}

class TipManager {
    
    var tipPercentages = [Double]()
    var currentTip: Tip
    var billAmount: Double
    
    init() {
        tipPercentages = [0.18, 0.20, 0.22]
        currentTip = Tip.SmallTip
        billAmount = 0.0
        loadValues()
    }

    var tipPercentage: Double {
        get { return tipPercentages[currentTip.rawValue] }
    }
    
    var tipAmount: Double {
        get { return billAmount * tipPercentage }
    }
    
    var totalAmount: Double {
        get { return billAmount + tipAmount }
    }
    
    /// MARK: Tip Percentages
    
    var smallTipPercentage: Double {
        get { return tipPercentages[Tip.SmallTip.rawValue] }
        set(percentage) { tipPercentages[Tip.SmallTip.rawValue] = percentage }
    }
    
    var mediumTipPercentage: Double {
        get { return tipPercentages[Tip.MediumTip.rawValue] }
        set(percentage) { tipPercentages[Tip.MediumTip.rawValue] = percentage }
    }
    
    var largeTipPercentage: Double {
        get { return tipPercentages[Tip.LargeTip.rawValue] }
        set(percentage) { tipPercentages[Tip.LargeTip.rawValue] = percentage }
    }
    
    var smallTipInteger: Int {
        get { return Int(smallTipPercentage * 100) }
        set(tip) { smallTipPercentage = Double(tip) / 100.0 }
    }
    
    var mediumTipInteger: Int {
        get { return Int(mediumTipPercentage * 100) }
        set(tip) { mediumTipPercentage = Double(tip) / 100.0 }
    }
    
    var largeTipInteger: Int {
        get { return Int(largeTipPercentage * 100) }
        set(tip) { largeTipPercentage = Double(tip) / 100.0 }
    }
    
    /// MARK: Tip Index
    
    func setTipIndex(tipIndex: Int) {
        if (tipIndex >= Tip.SmallTip.rawValue && tipIndex <= Tip.LargeTip.rawValue) {
            currentTip = Tip(rawValue: tipIndex)!
        }
    }
    
    /// MARK: Save and Load
    
    func loadValues() {
        var defaults = NSUserDefaults.standardUserDefaults()
        billAmount = defaults.doubleForKey("bill_amount_key")
        println("loaded billAmount \(billAmount)")
    }
    
    func saveValues() {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(billAmount, forKey: "bill_amount_key")
        defaults.synchronize()
    }
}
