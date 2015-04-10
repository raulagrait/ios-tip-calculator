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
        billAmount = 0.0
        tipPercentages = [0.18, 0.20, 0.22]
        currentTip = Tip.SmallTip
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
    
    func setTipIndex(tipIndex: Int) {
        if (tipIndex >= Tip.SmallTip.rawValue && tipIndex <= Tip.LargeTip.rawValue) {
            currentTip = Tip(rawValue: tipIndex)!
        }
    }
}
