//
//  ViewController.swift
//  Scene-ManualSegue
//
//  Created by JinsooMac on 11/15/18.
//  Copyright © 2018 jinsoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func wind(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualWind", sender: self)
    }
    
}

