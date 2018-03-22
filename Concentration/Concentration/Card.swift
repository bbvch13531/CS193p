//
//  Card.swift
//  Concentration
//
//  Created by bbvch13531 on 2018. 3. 11..
//  Copyright © 2018년 KyungYoung Heo. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    //card 는 Model이어서 UI independent해야하기 때문에 여기에 emoji나 img가 포함되지 않는다.
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init (){
        
        self.identifier = Card.getUniqueIdentifier()
    }
}
