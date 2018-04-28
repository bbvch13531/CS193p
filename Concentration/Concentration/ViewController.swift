//
//  ViewController.swift
//  Concentration
//
//  Created by bbvch13531 on 2018. 3. 11..
//  Copyright © 2018년 KyungYoung Heo. All rights reserved.
//  Controller

import UIKit

class ViewController: UIViewController {
    //    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    //    var game=Concentration(numberOfPairsOfCards:(cardButtons.count + 1) / 2)
    
    
    
    //To re-initialize lazy var
    private var game:Concentration{
        if _game == nil {
            print("game init")
            _game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
        }
        return _game!
    }
    private var numberOfPairsOfCards: Int{
        get{
            return (cardButtons.count + 1) / 2
        }
        // Read-only computed value면 get 블록이 없어도 된다!
    }
    var _game:Concentration?
    
    // lazy var 은 호출되기 전까지 실행되지 않음. 늦은 초기화 하지만 didSet을 사용하지 못한다.
    private(set) var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]! //Array<UIButton> 와 같음
    
    @IBAction private func newGame(_ sender: UIButton) {
        
        
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1

        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber) // link to model
            updateViewFromModel()
            
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    private func updateViewFromModel(){
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
    
    private var emojiChoices = ["🎃","👻","🍭","🍎","🦇","🥝","🦋","🌳","⚽️"]
    // MARK: aasd
    // TODO: aaaa
    //var emoji = Dictionary<Int, String>()
    private var emoji = [Int:String]()
    
    private func emoji (for card: Card) -> String {
        // optional 벗기는 일반적인 코드
        // return 에서 ?? 를 사용한다.
        /* ex1)
         if emoji[card.identifier] != nil {
         return emoji[card.identifier]!
         } else {
         return "?"
         }
         */
        
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
            
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random) // emoji 대입하고 삭제한다.
        }
        return emoji[card.identifier] ?? "?"
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
