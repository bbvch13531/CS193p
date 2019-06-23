//
//  Concentration.swift
//  NewConcentration
//
//  Created by KyungYoung Heo on 22/06/2019.
//  Copyright © 2019 KyungYoung Heo. All rights reserved.
//

import Foundation

class Concentration {
  var cards = [Card]()
  var indexOfOneAndOnlyFaceUpCard: Int?
  
  init(numberOfPairsOfCards: Int){
    for _ in 0..<numberOfPairsOfCards{
      let card = Card()
      
      cards.append(card)
      cards.append(card)
    }
    // TODO: Shuffle the cards
    for index in 0..<cards.count {
      let tmp = cards[index]
      let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
      cards[index] = cards[randomIndex]
      cards[randomIndex] = tmp
    }
    
  }
  
  func chooseCard(at index: Int) {
    if !cards[index].isMatched {
      if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
        if cards[matchIndex].identifier == cards[index].identifier {
          // correct
          cards[matchIndex].isMatched = true
          cards[index].isMatched = true
        }
        cards[index].isFaceUp = true
        indexOfOneAndOnlyFaceUpCard = nil
      } else {
        for flipDownIndex in cards.indices {
          cards[flipDownIndex].isFaceUp = false
        }
        cards[index].isFaceUp = true
        indexOfOneAndOnlyFaceUpCard = index
      }
      
    }
  }
}
