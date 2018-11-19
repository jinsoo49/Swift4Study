//
//  ViewController.swift
//  IBTest
//
//  Created by JinsooMac on 11/13/18.
//  Copyright © 2018 jinsoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet var uiTitle01: UILabel!
    @IBOutlet var uiTitle02: UILabel!
    @IBAction func clickBtn01(_ sender: Any) {
        self.uiTitle01.text = "Button01 Clicked"
    }
    @IBAction func clickBtn02(_ sender: Any) {
        self.uiTitle02.text = "Button02 Clicked"
    }
    @IBOutlet var uiTitle03: UILabel!
    @IBAction func clickBtn03(_ sender: Any) {
        self.uiTitle03.text = "Button03 Clicked"
    }
    
    @IBOutlet var uiTitle04: UILabel!
    @IBAction func clickBtn04(_ sender: Any) {
        self.uiTitle04.text = "Button04 Clicked"
    }
    @IBOutlet weak var uiTitle05: UILabel!
    @IBAction func clickBtn05(_ sender: Any) {
        self.uiTitle05.text = "Button05 Clicked"
    }
}

