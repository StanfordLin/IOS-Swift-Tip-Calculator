//
//  ViewController.swift
//  TipPro
//
//  Created by Stanford on 2016-07-04.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalAmountField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
   
    
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
    
        
        
        guard let billAmount = Double(billAmountField.text!) else {
            //show error
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
            return
        }
        
        var tipPercentage = 0.0
        
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.15
        case 1:
            tipPercentage = 0.18
        case 2:
            tipPercentage = 0.20
        default:
            break
        }
        
        let roundedBillAmount = round(100*billAmount)/100
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = round(100*tipAmount)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        if (!billAmountField.editing) {
            billAmountField.text = String(format: "%.2f", roundedBillAmount)
        }
        tipAmountField.text = String(format: "%.2f", roundedTipAmount)
        totalAmountField.text = String(format: "%.2f", totalAmount)
    }
        
        
        
//        guard let billAmount = Double(billAmountField.text!) else { //if te billAmount cannot be "casted", it stops what's happening and clears the textfields
//            //show error
//            billAmountField.text = ""
//            tipAmountField.text = ""
//            totalAmountField.text = ""
//            return
//        }
//        var tipPercentage = 0.0 // If billAmount does have a number, the function continues.
//        
//        switch tipSelector.selectedSegmentIndex{ //It uses a switch statement to read the segmented control and set tipPercentage.
//        case 0:
//            tipPercentage = 0.15
//        case 1:
//            tipPercentage = 0.18
//        case 2:
//            tipPercentage = 0.20
//        default:
//            break
//        } //It then calculates the tipAmount and totalAmount.
//        let roundedBillAmount = round(100 * billAmount) / 100 //rounds the bill amount
//        let tipAmount = roundedBillAmount * tipPercentage //multiplies the roundedBillAmount by the tipPerentage
//        let roundedTipAmount = round(100 * tipAmount) / 100 //rounds the tip amount
//        let totalAmount = roundedBillAmount + roundedTipAmount // adds roundedBillAmount and roundedTipAmount
//        
//        if (!billAmountField.editing) { // if billAmountField has a value, it is set as billAmountField
//            billAmountField.text = String(format: "%.2f", roundedBillAmount)
//        }
//        tipAmountField.text = String(format: "%.2f", roundedTipAmount) //Finally, it updates the respective text fields.
//        totalAmountField.text = String(format: "%.2f", totalAmount)


}

