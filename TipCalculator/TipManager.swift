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
    
    var tipPercentages = [Double]() {
        didSet {
            saveTipPercentages()
        }
    }
    
    var currentTip: Tip
    var billAmount: Double {
        didSet {
            saveBillAmount()
        }
    }
    
    init() {
        tipPercentages = [0.18, 0.20, 0.22]
        currentTip = Tip.SmallTip
        billAmount = 0.0
        tipIndexValue = 0
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
    
    var tipIndexValue: Int
    var tipIndex:Int {
        get { return tipIndexValue }
        set(index) {
            if (index >= Tip.SmallTip.rawValue && index <= Tip.LargeTip.rawValue) {
                tipIndexValue = index
                currentTip = Tip(rawValue: tipIndex)!
                saveTipIndex()
            }
        }
    }
    
    /// MARK: Save and Load
    
    let currentDateKey = "current_date_key"
    let billAmountKey = "bill_amount_key"
    let tipPercentagesKey = "tip_percentages_key"
    let tipIndexKey = "tip_index_key"
    
    func loadValues() {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if let storedDate = defaults.objectForKey(currentDateKey) as? NSDate {
            var deltaInterval = -1 * storedDate.timeIntervalSinceNow
            println("\(deltaInterval) seconds elapsed since values saved")
            if deltaInterval < 10 * 60 {
                billAmount = defaults.doubleForKey(billAmountKey)
            }
        }
        
        if let storedTipPercentages = defaults.objectForKey(tipPercentagesKey) as? [Double] {
            tipPercentages = storedTipPercentages
        }
        tipIndex = defaults.integerForKey(tipIndexKey)
    }

    func saveBillAmount() {
        var currentDate = NSDate();
        var defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setDouble(billAmount, forKey: billAmountKey)
        defaults.setObject(currentDate, forKey: currentDateKey)
        defaults.synchronize()
    }
    
    func saveTipPercentages() {
        var currentDate = NSDate();
        var defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(tipPercentages, forKey: tipPercentagesKey)
        defaults.synchronize()
    }
    
    func saveTipIndex() {
        var currentDate = NSDate();
        var defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(tipIndex, forKey: tipIndexKey)
        defaults.synchronize()
    }
}
