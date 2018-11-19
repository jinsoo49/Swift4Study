//
//  SecondViewController.swift
//  Scene-Trans02
//
//  Created by JinsooMac on 11/14/18.
//  Copyright © 2018 jinsoo. All rights reserved.
//

import UIKit
class SecondViewController: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    @IBAction func back2(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
