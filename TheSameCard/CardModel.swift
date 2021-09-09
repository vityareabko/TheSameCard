//
//  CardModel.swift
//  TheSameCard
//
//  Created by Витя Рябко on 09/09/2021.
//

import Foundation


struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var indentifier: Int
    
    
    static var indentifierNumber = 0
    
    static func indentifierGeration () -> Int {
        indentifierNumber += 1
        return indentifierNumber
    }
    
    
    init(){
        self.indentifier = Card.indentifierGeration()
    }
}

