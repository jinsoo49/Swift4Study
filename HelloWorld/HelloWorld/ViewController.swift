//
//  ViewController.swift
//  HelloWorld
//
//  Created by JinsooMac on 11/8/18.
//  Copyright © 2018 Jinsoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func sayHello(_ sender: Any) {
        self.uiTitle.text = "Hello. world"
    }
}

