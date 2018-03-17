//
//  Concentration.swift
//  Concentration
//
//  Created by KyungYoung Heo on 2018. 3. 11..
//  Copyright © 2018년 KyungYoung Heo. All rights reserved.
//  Model

import Foundation

class Concentration
{
    
    var cards = [Card]()    //initialize with empty array of card
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
            //  cards.append(card)
            //  cards.append(card) 와 같음
        }
        
        for _ in 1...cards.count{
            let randomIndex1 = Int(arc4random_uniform(UInt32(cards.count)))
            let randomIndex2 = Int(arc4random_uniform(UInt32(cards.count)))
            cards.swapAt(randomIndex1,randomIndex2);
            //cards의 identifier를 random swap한다.
            
            print("random is \(randomIndex1) swap is \(randomIndex2)")
        }
        //  countable range
        //  [0,number) 0..<number
        //  [1,number] 1...number
        
        // TODO: Shuffle the cards
        
    }
   
}

