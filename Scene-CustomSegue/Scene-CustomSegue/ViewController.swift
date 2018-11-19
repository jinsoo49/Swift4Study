//
//  ViewController.swift
//  Scene-CustomSegue
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("segueway identifier: \(segue.identifier!)")
        
        if(segue.identifier == "custom_segue") {
            NSLog("커스텀 세그 실행")
        } else if (segue.identifier == "action_segue") {
            NSLog("액션 세그 실행")
        } else {
            NSLog("알수 없는 세그")
        }
        
        
    }

    @IBAction func unwindToVC(_ segue: UIStoryboardSegue){
        
    }

}

