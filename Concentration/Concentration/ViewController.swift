//
//  ViewController.swift
//  Concentration
//
//  Created by KyungYoung Heo on 2018. 3. 11..
//  Copyright © 2018년 KyungYoung Heo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        flipCard(withEmoji: "👻", on: sender)
    }
    @IBAction func touchSecondCard(_ sender: UIButton) {
        flipCount += 1
        flipCard(withEmoji: "🎃", on: sender)
    }
    func flipCard(withEmoji emoji: String, on button: UIButton){
//        print("flipCard(withEmoji: \(emoji)")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
    
}
