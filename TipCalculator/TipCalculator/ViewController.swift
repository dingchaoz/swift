//
//  ViewController.swift
//  TipCalculator
//
//  Created by dingchao on 6/13/15.
//  Copyright (c) 2015 dingchao. All rights reserved.
//

// Import the codes in the UIKit framework so they can be used
import UIKit

// Declare a new class ViewController that subclasses Apples's UIViewController
class ViewController: UIViewController {
    
    // Declare 4 variables(properties in the ViewController class)
    // Interface builder scans code looking for any properties in view controller prefixed with @IBOutlet to connet them to views
    // ! indicates variables are optional values but implicititly unwrapped
    @IBOutlet var totalTextField: UITextField!
    @IBOutlet var taxPctSlider: UISlider!
    @IBOutlet var taxPctLable: UILabel!
    @IBOutlet var resultsTextView:UITextView!
    
    // Call the class defined in TipCalculatorModel.swift and return the result in tipCalc
    let tipCalc = TipcCalculatorModel(total: 33.25, taxPct: 0.06)
    
    func refreshUI(){
        
        // Convert double to string and show in textfield in UI
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        
        // Show tax percentage as an int rather than a decimal
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        
        // Update label on tax percentage
        taxPctLable.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        
        // Clear the results text view until the user taps the calculate button
        resultsTextView.text = ""
        
    }
    
    // Declare 3 methos in class , @IBAction makes interface builder notice the methods
    // When declare callbacks for ations from views, always need to have a fuction with no return values, and takes a single parameter
    // of type AnyObject as a parameter which represents a class of any type
    @IBAction func calculateTapped(sender : AnyObject) {
        
        // Conver the string input to double and store as an argument of object tipCalc
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        
        // Call method in tipCalc and return a dictionary of possible tip perc mapped to tip values
        let possibleTips = tipCalc.returnPossibleTips()
        
        var results = ""
        
        // Enumerate through both keys and values of a dictionary at the same time
        for (tipPct,tipValue) in possibleTips {
            
            results += "\(tipPct)%:\(tipValue)\n"
        }
        
        // Set result text to the string built above
        resultsTextView.text = results
        
    }
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
        
    }
    @IBAction func viewTapped(sender : AnyObject) {
        // Dismiss the keyboard when view is tapped
        totalTextField.resignFirstResponder()
        
    }
  
    
    // This method is called with the root view of the view controller is first accessed, it is called before any other methods on view(other than initialization)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Call refreshUI() after view is loaded
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

