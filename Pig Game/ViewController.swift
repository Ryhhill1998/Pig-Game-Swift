//
//  ViewController.swift
//  Pig Game
//
//  Created by Ryan Henzell-Hill on 08/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreView: UILabel!
    
    @IBOutlet weak var currentScoreView: UILabel!
    
    @IBOutlet weak var turnsView: UILabel!
    
    @IBOutlet weak var diceImageView1: UIImageView!
    
    @IBOutlet weak var diceImageView2: UIImageView!
    
    func getDiceRoll() -> Int {
        return Int.random(in: 1...6)
    }
    
    func randomiseDiceImage(diceImageView: UIImageView, roll: Int) {
        let randomImageName = "dice" + String(roll)
        diceImageView.image = UIImage(imageLiteralResourceName: randomImageName)
    }
    
    func incrementTurns() {
        guard let turnsText = turnsView.text else { return }
        guard let turns = Int(turnsText) else { return }
        turnsView.text = String(turns + 1)
    }
    
    func updateCurrentScore(roll: Int) {
        guard let currentScoreText = currentScoreView.text else { return
        }
        guard let currentScore = Int(currentScoreText) else { return }
        print(currentScore)
        print(roll)
        currentScoreView.text = String(currentScore + roll)
        print(currentScore + roll)
        print()
    }
    
    func rollDice(diceImageView: UIImageView) {
        let roll = getDiceRoll()
        incrementTurns()
        updateCurrentScore(roll: roll)
        randomiseDiceImage(diceImageView: diceImageView, roll: roll)
    }
    
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        rollDice(diceImageView: diceImageView1)
    }
    
    @IBAction func holdButtonTapped(_ sender: UIButton) {
    }
}

