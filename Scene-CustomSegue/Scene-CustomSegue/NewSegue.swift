//
//  NewSegue.swift
//  Scene-CustomSegue
//
//  Created by JinsooMac on 11/15/18.
//  Copyright © 2018 jinsoo. All rights reserved.
//

import UIKit
class NewSegue: UIStoryboardSegue {
    override func perform() {
        
        let srcUVC = self.source
        
        let destUVC = self.destination
        
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown)
    }
}
