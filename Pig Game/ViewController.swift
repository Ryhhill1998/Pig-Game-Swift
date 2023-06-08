//
//  ViewController.swift
//  Pig Game
//
//  Created by Ryan Henzell-Hill on 08/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var currentRoll = 0

    @IBOutlet weak var scoreView: UILabel!
    
    @IBOutlet weak var currentScoreView: UILabel!
    
    @IBOutlet weak var turnsView: UILabel!
    
    @IBOutlet weak var diceImageView1: UIImageView!
    
    @IBOutlet weak var diceImageView2: UIImageView!
    
    func getDiceRoll() -> Int {
        return Int.random(in: 1...6)
    }
    
    func updateDiceImage(diceImageView: UIImageView, roll: Int) {
        let randomImageName = "dice" + String(roll)
        diceImageView.image = UIImage(imageLiteralResourceName: randomImageName)
    }
    
    func incrementTurns() {
        guard let turnsText = turnsView.text else { return }
        guard let turns = Int(turnsText) else { return }
        turnsView.text = String(turns + 1)
    }
    
    func setCurrentScore(score: Int) {
        currentScoreView.text = String(score)
    }
    
    func getCurrentScore() -> Int {
        guard let currentScoreText = currentScoreView.text else { return 0
        }
        guard let currentScore = Int(currentScoreText) else {
            return 0
        }
        return currentScore
    }
    
    func updateCurrentScore() {
        setCurrentScore(score: (getCurrentScore() + currentRoll))
    }
    
    func getSavedScore() -> Int {
        guard let savedScoreText = scoreView.text else {
            return 0
        }
        guard let savedScore = Int(savedScoreText) else {
            return 0
        }
        return savedScore
    }
    
    func setSavedScore(score: Int) {
        scoreView.text = String(score)
    }
    
    func rollDice(diceImageView: UIImageView) {
        let roll = getDiceRoll()
        updateDiceImage(diceImageView: diceImageView, roll: roll)
        currentRoll += roll
    }
    
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        if getSavedScore() >= 100 {
            return
        }
        
        rollDice(diceImageView: diceImageView1)
        
        let roll1 = currentRoll
        
        rollDice(diceImageView: diceImageView2)
        
        let roll2 = currentRoll - roll1
        
        if currentRoll == 2 {
            setCurrentScore(score: 0)
            setSavedScore(score: 0)
        } else if roll1 == 1 || roll2 == 1 {
            setCurrentScore(score: 0)
        } else {
            updateCurrentScore()
        }
        
        currentRoll = 0
        
        incrementTurns()
    }
    
    @IBAction func holdButtonTapped(_ sender: UIButton) {
        setSavedScore(score: getSavedScore() + getCurrentScore())
        setCurrentScore(score: 0)
    }
}

