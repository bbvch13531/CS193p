//
//  Card.swift
//  NewConcentration
//
//  Created by KyungYoung Heo on 22/06/2019.
//  Copyright © 2019 KyungYoung Heo. All rights reserved.
//

import Foundation

struct Card {
  var isFaceUp = false
  var isMatched = false
  var identifier: Int
  
  static var identifierFactory = 0
  
  static func getUniqueIdentifier() -> Int {
    identifierFactory += 1
    return identifierFactory
  }
  
  init(){
    self.identifier = Card.getUniqueIdentifier()
  }
}
