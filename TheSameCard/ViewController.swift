//
//  ViewController.swift
//  TheSameCard
//
//  Created by Витя Рябко on 08/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = ConcentrationGame(numberOfPairsOfCards: (ButtonsCollection.count + 1) / 2)
    
    var touches = 0 {
        didSet{
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    var emojiCollection = ["🐟","☘️","🍄","☀️","❄️","⚽️","⚾️","🏹","🥊","⛱","🧰","⏰"]
    
    var emojiDict = [Int: String]()
    
    func emojiIndetifier(for card: Card) -> String{
        if emojiDict[card.indentifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDict[card.indentifier] = emojiCollection.remove(at: randomIndex)
        }
        
        return emojiDict[card.indentifier] ?? "?"
    }
    
    func updateViewfromModel(){
        for index in ButtonsCollection.indices{
            let button = ButtonsCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIndetifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.9248257279, green: 0.9226208329, blue: 0.8819627166, alpha: 1)
            }else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5575068593, blue: 0, alpha: 0) : #colorLiteral(red: 0.9242156148, green: 0.5677548647, blue: 0, alpha: 1)
            }
        }
    }
    
    
    
    
    
    
    @IBOutlet var ButtonsCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func ActionButton(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = ButtonsCollection.firstIndex(of: sender){
            game.chooseCard(at: buttonIndex)
            updateViewfromModel()
        }
    }
}

