//
//  ViewController.swift
//  Tip
//
//  Created by AUNG PHYO on 6/16/18.
//  Copyright © 2018 AUNG PHYO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var customTip = 0.0
    var people = 1.0
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBOutlet weak var eachPerson: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let defaults = UserDefaults.standard
        
        customTip = defaults.double(forKey: "tip_p")
        people = defaults.double(forKey: "total_people")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        tipSegment.selectedSegmentIndex = -1
        billField.text = billField.placeholder
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentage = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        var tip = 0.0
        if tipSegment.selectedSegmentIndex == -1{
            tip = bill * customTip
        }
        else{
            tip = bill * tipPercentage[tipSegment.selectedSegmentIndex]
        }
        let total = bill + tip
        let each_person = total / people
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        eachPerson.text = String(format: "$%.2f", each_person)
    }
    
    
   
}

