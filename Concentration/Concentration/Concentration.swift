//
//  Concentration.swift
//  Concentration
//
//  Created by bbvch13531 on 2018. 3. 11..
//  Copyright © 2018년 KyungYoung Heo. All rights reserved.
//  Model

import Foundation

class Concentration
{
    private(set) var cards = [Card]()    //initialize with empty array of card
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex : Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }
                    else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {   // 인자 선언 안하면 디폴트로 newValue
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index)) chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
//                indexOfOneAndOnlyFaceUpCard = nil  computed var이 같은 기능 수행
            } else {
                // either no cards or 2 cards are face up
                
/*   computed var이 같은 기능 수행 */
//                for flipDownIndex in cards.indices {
//                    cards[flipDownIndex].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0,"Concentration.init(at: \(numberOfPairsOfCards)) you must have at least one pair of cards")
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
