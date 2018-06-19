//
//  SettingViewController.swift
//  Tip
//
//  Created by AUNG PHYO on 6/17/18.
//  Copyright © 2018 AUNG PHYO. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    
    @IBOutlet weak var customTipAmount: UITextField!
    @IBOutlet weak var numOfPerson: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func customTipCal(_ sender: Any) {
        let tip = Double(customTipAmount.text!) ?? 0
       
        let tipPercent = tip / 100
        
        let defaults = UserDefaults.standard
        
        defaults.set(tipPercent, forKey: "tip_p")
        
        defaults.synchronize()
        
    }
    
    @IBAction func split(_ sender: Any) {
        let persons = Int(numOfPerson.text!) ?? 1
        
        let defaults = UserDefaults.standard
        
        defaults.set(persons, forKey: "total_people")
        
        defaults.synchronize()
    }
    
    

}
