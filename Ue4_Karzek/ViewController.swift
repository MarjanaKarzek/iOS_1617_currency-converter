//
//  ViewController.swift
//  Ue4_Karzek
//
//  Created by Marjana Karzek on 06/12/16.
//  Copyright © 2016 Marjana Karzek. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var euroField: UITextField!
    @IBOutlet weak var dollarField: UITextField!
    @IBOutlet weak var poundField: UITextField!
    
    @IBOutlet weak var courseDollarField: UITextField!
    @IBOutlet weak var coursePoundField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return false
    }
    
    @IBAction func euroFieldDidEndEditing(_ sender: UITextField) {
        let courseDollar = Double(courseDollarField.text ?? "") ?? 0.0
        let coursePound = Double(coursePoundField.text ?? "") ?? 0.0
        
        var value1 = Double(sender.text ?? "") ?? 0.0
        value1 = value1 * courseDollar
        dollarField.text = String(format: "%.2lf", value1)
        
        var value2 = Double(sender.text ?? "") ?? 0.0
        value2 = value2 * coursePound
        poundField.text = String(format: "%.2lf", value2)
    }
    
    @IBAction func dollarFieldDidEndEditing(_ sender: UITextField) {
        let courseDollar = Double(courseDollarField.text ?? "") ?? 0.0
        let coursePound = Double(coursePoundField.text ?? "") ?? 0.0
        
        var value = Double(sender.text ?? "") ?? 0.0
        
        value = value / courseDollar
        euroField.text = String(format: "%.2lf", value)
        
        value = value * coursePound
        poundField.text = String(format: "%.2lf", value)
        
    }
    
    @IBAction func poundFieldDidEndEditing(_ sender: UITextField) {
        let courseDollar = Double(courseDollarField.text ?? "") ?? 0.0
        let coursePound = Double(coursePoundField.text ?? "") ?? 0.0
        
        var value = Double(sender.text ?? "") ?? 0.0
        
        value = value / coursePound
        euroField.text = String(format: "%.2lf", value)
        
        value = value * courseDollar
        dollarField.text = String(format: "%.2lf", value)
    }
    
    @IBAction func courseDollarDidEndEditing(_ sender: Any) {
        let courseDollar = Double(courseDollarField.text ?? "") ?? 0.0
        
        var value = Double(euroField.text ?? "") ?? 0.0
        
        value = value * courseDollar
        dollarField.text = String(format: "%.2lf", value)
    }
    
    @IBAction func coursePoundDidEndEditing(_ sender: Any) {
        let coursePound = Double(coursePoundField.text ?? "") ?? 0.0

        var value = Double(euroField.text ?? "") ?? 0.0
        
        value = value * coursePound
        poundField.text = String(format: "%.2lf", value)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let courseDollarString: NSString
        if let dollarURL = URL(string: "https://download.finance.yahoo.com/d/quotes.csv?s=EURUSD=X&f=a") {
            do {
                courseDollarString = try NSString(contentsOf: dollarURL, encoding: String.Encoding.utf8.rawValue)
            } catch {
                courseDollarString = ""
            }
            courseDollarField.text = courseDollarString.trimmingCharacters(in: .whitespacesAndNewlines)
            let courseDollar = Double(courseDollarField.text ?? "") ?? 0.0
            var value1 = Double(euroField.text ?? "") ?? 0.0
            value1 = value1 * courseDollar
            dollarField.text = String(format: "%.2lf", value1)
        }
        
        let coursePoundString: NSString
        if let poundURL = URL(string: "https://download.finance.yahoo.com/d/quotes.csv?s=EURGBP=X&f=a") {
            do {
                coursePoundString = try NSString(contentsOf: poundURL, encoding: String.Encoding.utf8.rawValue)
            } catch {
                coursePoundString = ""
            }
            coursePoundField.text = coursePoundString.trimmingCharacters(in: .whitespacesAndNewlines)
            let coursePound = Double(coursePoundField.text ?? "") ?? 0.0
            var value2 = Double(euroField.text ?? "") ?? 0.0
            value2 = value2 * coursePound
            poundField.text = String(format: "%.2lf", value2)
        }
    }
}

