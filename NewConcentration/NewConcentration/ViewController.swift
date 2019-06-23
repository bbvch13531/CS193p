//
//  ViewController.swift
//  NewConcentration
//
//  Created by KyungYoung Heo on 22/06/2019.
//  Copyright © 2019 KyungYoung Heo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  lazy var game = Concentration(numberOfPairsOfCards: (flipcardButtons.count + 1) / 2)
  // TODO: Use ViewDidLoad()
  
  var flipCount = 0 {
    didSet {
      flipCountLabel.text = "Flips : \(flipCount)"
    }
  }
  
  @IBOutlet weak var flipCountLabel: UILabel!
  
  var emojiChoieces = ["👻", "🍺", "🎃", "🕷", "💀", "🐙", "🌙", "⚡️"]
  //, "⭐️", "🎲", "🚀", "📱", "💻", "🖋", "❤️", "🇰🇷"]
  var emojis = [Int: String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBOutlet var flipcardButtons: [UIButton]!
  
  @IBAction func touchCard(_ sender: UIButton) {
    print("touch!")
    flipCount += 1
    if let cardNumber = flipcardButtons.firstIndex(of: sender) {
//      print(emojiChoieces[cardNumber])
      game.chooseCard(at: cardNumber)
      updateViewFromModel()
    } else {
        print("chosen card was not in flipcardButtons")
    }
    
  }
  func updateViewFromModel() {
    for index in flipcardButtons.indices {
      let button = flipcardButtons[index]
      let card = game.cards[index]
      
      if card.isFaceUp {
        button.setTitle(emoji(for: card), for: UIControl.State.normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.4295772314, blue: 0.2921108305, alpha: 1)
      } else {
        button.setTitle("", for: UIControl.State.normal)
        button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
      }
    }
  }
  
  func emoji(for card: Card) -> String {
//    if let chosenEmoji = emojis[card.identifier] {
//        return chosenEmoji
//    } else {
//      return "?"
//    }
    if emojis[card.identifier] == nil, emojiChoieces.count > 0 {
      emojis[card.identifier] = emojiChoieces.remove(at: emojiChoieces.count.arc4random)
    }
    return emojis[card.identifier] ?? "?"
  }
  
}

// extension 으로 코드 가독성 높이기
extension Int {
  var arc4random: Int {
    if self > 0{
      return Int(arc4random_uniform(UInt32(self)))
    }
    else if self < 0 {
      return -Int(arc4random_uniform(UInt32(abs(self))))
    }
    else {
      return 0
    }
  }
}
