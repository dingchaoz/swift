// Playground - noun: a place where people can play

import UIKit

// Create unnamed tuple
let tipAndTotal:(Double, Double, Double) = (4.00, 25.19, 22.4)

// Access the 1st element of unnamed tuple
tipAndTotal.0

// Access the 2nd element of unnamed tuple
tipAndTotal.1

tipAndTotal.2


// Add index name to the created tuple
let (theTipAmt, theTotal, test) = tipAndTotal

// Access the 1st named index
theTipAmt

// Access the 2nd named index
theTotal

// Create named tuples using inferred syntax
// Create using explicit syntax let tipAndTotalNamed:(tipAmt:Double, total:Double) = (4.00,25.19)
let tipAndTotalNamed = (tipAmt:4.00, total:25.19)

tipAndTotalNamed.tipAmt

tipAndTotalNamed.total

let total = 21.19
let taxPct = 0.06
let subtotal = total/(1+taxPct)
func calcTipWithTipPct(tipPct:Double) -> (tipAmt:Double, total:Double) {
    
    let tipAmt = subtotal * tipPct
    let finalTotal = total + tipAmt
    return (tipAmt, finalTotal)
}

calcTipWithTipPct(0.20)

//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by dingchao on 6/13/15.
//  Copyright (c) 2015 dingchao. All rights reserved.
//  This file creates a class of TipCalculator, a model that presents data
//  and operations of TipCalculator App will perform on the data

import Foundation

// Playground - noun: a place where people can play
// a calculator of tip

// Define the class Tipcalculator, start class name with Capital letter
class TipcCalculatorModel  {
    
    // create 3 properties of variables, properties declared must be set values here or in initializer
    // these 3 properties can be accessed throughout the class
    var total:Double
    var taxPct:Double
    
    // create a computed property which does not store value, but get computed each time based on other values
    var subtotal:Double {
        
        // get the return result of computation by total and taxPct two variables
        get {
            
            return total / (taxPct + 1)
        }
    }
    
    // create initializer with 2 parmaters
    init(total:Double, taxPct:Double){
        
        // the properties names are the same with paramters names, so we add self. to distinguish
        // the initializer property total take the value from parameter total
        self.total = total
        
        // the properties names are the same with paramters names, so we add self. to distinguish
        // the initializer property taxPct take the value from parameter taxPct
        self.taxPct = taxPct
        
        
    }
    
    // create method named calcTipwithTipPct using func
    // it takes 1 parameter type Double, and return type tuple using -> symbol
    func calcTipWithTipPct(tipPct:Double) -> (tipAmt:Double, total:Double) {
        
        let tipAmt = subtotal * tipPct
        let finalTotal = total + tipAmt
        return (tipAmt, finalTotal)
    }

    
    // create method to return result in a dictionary,which is a struct in swift
    // [Int:Double] is short for dictionary<Int:Double>
    func returnPossibleTips() -> [Int: (tipAmt:Double, total:Double)] {
        
        // create a constant array of 3 elements
        let possibleTips = [0.15,0.18,0.20]
        
        // create the result as a var here
        var result = Dictionary<Int: (tipAmt:Double, total:Double)>()
        
        // possibletip is the iterating element in the array possibleTips
        for possibletip in possibleTips {
            
            // cast into a int type
            let intPct = Int(possibletip*100)
            
            // for each int in result, calculate the tip
            result[intPct] = calcTipWithTipPct(possibletip)
            
        }
        
        return result
        
    }
}










