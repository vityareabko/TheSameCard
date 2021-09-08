//
//  ViewController.swift
//  TheSameCard
//
//  Created by Витя Рябко on 08/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var touches = 0 {
        didSet{
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    func flippButton(emoji: String, button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5575068593, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9248257279, green: 0.9226208329, blue: 0.8819627166, alpha: 1)
        }
    }
    
    let emojiCollection = ["☘️","🐟","🐟","☘️"]
    
    
    
    
    
    @IBOutlet var ButtonsCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func ActionButton(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = ButtonsCollection.firstIndex(of: sender){
            flippButton(emoji: emojiCollection[buttonIndex], button: sender)
        }
    }
}

