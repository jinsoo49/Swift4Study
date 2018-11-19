//
//  ViewController.swift
//  UpDown
//
//  Created by JinsooMac on 11/13/18.
//  Copyright © 2018 jinsoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK:- Properties
    // MARK: IBOutlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var turnCountLabel: UILabel!
    @IBOutlet var inputField: UITextField!
    
    // MARK: Stroed Properties
    var randomNumber: UInt32 = 0
    var turnCount: Int = 0
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
        self.initializeGame()
    }
    
    // MARK:- Methods
    @IBAction func touchUpSubmitButton(_ sender: UIButton) {
        print("touch up submit button")
        
        guard let inputText = self.inputField.text, inputText.isEmpty == false else {
            print("입력값 없음")
            return
        }
        
        guard let inputNumber: UInt32 = UInt32(inputText) else {
            print("입력값이 잘못 되었음")
            return
        }
        
        turnCount += 1
        self.turnCountLabel.text = "\(turnCount)"
        
        if inputNumber > randomNumber {
            self.resultLabel.text = "up!"
        } else if inputNumber < randomNumber {
            self.resultLabel.text = "down!"
        } else {
            self.resultLabel.text = "정답입니다"
        }
    }
    
    @IBAction func tapBackGround(_ sender: UITapGestureRecognizer) {
        print("tap background view")
        self.inputField.resignFirstResponder()
    }
    
    // MARK: Custom Methods
    func initializeGame() {
        self.randomNumber = arc4random() % 25
        self.turnCount = 0
        
        self.resultLabel.text = "Start!"
        self.turnCountLabel.text = "\(turnCount)"
        self.inputField.text = nil
        
        print("임의의 숫자 \(self.randomNumber)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initializeGame()
    }


}

