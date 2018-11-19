//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by JinsooMac on 11/16/18.
//  Copyright © 2018 jinsoo. All rights reserved.
//

import UIKit
class FormViewController: UIViewController {
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    @IBOutlet var isSwitch: UILabel!
    @IBOutlet var labelInterval: UILabel!
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn) {
            self.isSwitch.text = "갱신"
        } else {
            self.isSwitch.text = "갱신안함"
        }
    }
    @IBAction func onStepper(_ sender: UIStepper) {
        let val = Int(sender.value)
        self.labelInterval.text = "\(val)분 마다"
    }
    
    
    
    @IBAction func onSubmit(_ sender: Any) {
//        let preVC = self.presentingViewController
//        guard let vc = preVC as? ViewController else {
//            return
//        }
//
//        vc.paramEmail = self.email.text
//        vc.paramUpdate = self.isUpdate.isOn
//        vc.paramInterval = self.interval.value
        
//        let ad = UIApplication.shared.delegate as? AppDelegate
//
//        ad?.paramEmail = self.email.text
//        ad?.paramUpdate = self.isUpdate.isOn
//        ad?.paramInterval = self.interval.value
//
//        self.presentingViewController?.dismiss(animated: true)
        let ud = UserDefaults.standard
        
        ud.set(self.email.text, forKey: "email")
        ud.set(self.isUpdate.isOn, forKey: "isUpdate")
        ud.set(self.interval.value, forKey: "interval")
        
        self.presentingViewController?.dismiss(animated: true)
    }
}
