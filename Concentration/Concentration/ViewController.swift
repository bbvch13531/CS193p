//
//  ViewController.swift
//  Concentration
//
//  Created by KyungYoung Heo on 2018. 3. 11..
//  Copyright © 2018년 KyungYoung Heo. All rights reserved.
//  Controller

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    // lazy var 은 호출되기 전까지 실행되지 않음. 늦은 초기화 하지만 didSet을 사용하지 못한다.
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]! //Array<UIButton> 와 같음
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber) // link to model
            updateViewFromModel()
            
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
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
    
    var emojiChoices = ["🎃","👻","🍭","🍎","🦇","🥝","🦋","🌳","⚽️"]
    // MARK: aasd
    // TODO: aaaa
    //var emoji = Dictionary<Int, String>()
    var emoji = [Int:String]()
    
    func emoji (for card: Card) -> String {
        // optional 벗기는 일반적인 코드
        // return 에서 ?? 를 사용한다.
        /* ex1)
         if emoji[card.identifier] != nil {
         return emoji[card.identifier]!
         } else {
         return "?"
         }
         */
        
        // ex2)
        
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex) // emoji 대입하고 삭제한다.
        }
        return emoji[card.identifier] ?? "?"
    }
}

