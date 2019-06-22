//
//  ViewController.swift
//  NewConcentration
//
//  Created by KyungYoung Heo on 22/06/2019.
//  Copyright © 2019 KyungYoung Heo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var flipCount = 0 
  var emojiChoieces = ["👻", "🍺", "🎃", "🕷", "💀", "💀", "🐙", "🌙", "⚡️", "⭐️", "🎲", "🚀", "📱", "💻", "🖋", "❤️", "🇰🇷"]
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBOutlet var flipcardButtons: [UIButton]!
  
  @IBAction func touchCard(_ sender: UIButton) {
    print("touch!")
    
    if let emoji = flipcardButtons.firstIndex(of: sender) {
      print(emojiChoieces[emoji])
      flipCard(Withemoji: emojiChoieces[emoji], on: sender)
    } else {
        print("chosen card was not in flipcardButtons")
    }
    
    
  }
  
  func flipCard(Withemoji emoji: String, on button: UIButton){
    if button.currentTitle == emoji {
      button.setTitle("", for: UIControl.State.normal)
      button.backgroundColor = #colorLiteral(red: 1, green: 0.4295772314, blue: 0.2921108305, alpha: 1)
    } else {
      button.setTitle(emoji, for: UIControl.State.normal)
      button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }
  }
}

