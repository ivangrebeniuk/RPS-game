//
//  ViewController.swift
//  RPS
//
//  Created by Иван Гребенюк on 25.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appSignLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var rockSignButton: UIButton!
    @IBOutlet weak var paperSignButton: UIButton!
    @IBOutlet weak var scissorsSignButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGameState()
    }
    
    @IBAction func rockButtonTapped(_ sender: UIButton) {
        play(.rock)
    }
    
    @IBAction func paperButtonTapped(_ sender: UIButton) {
        play(.paper)
    }
    
    
    @IBAction func scissorsButtonTapped(_ sender: UIButton) {
        play(.scissors)
    }
    
    @IBAction func playAgainButtonTapped(_ sender: UIButton) {
        resetGameState()
    }
    
    func play(_ playerTurn: Sign) {
        let rival = randomSign()
        
        rockSignButton.isEnabled = false
        paperSignButton.isEnabled = false
        scissorsSignButton.isEnabled = false
        
        let result = playerTurn.compareSigns(rivalSign: rival)
        
        appSignLabel.text = rival.emojiSigh
        
        switch result {
        case .draw:
            gameStatusLabel.text = "Ничья. Попробуй еще раз!"
            self.view.backgroundColor = .yellow
        case .lose:
            gameStatusLabel.text = "Лузер!🤡"
            self.view.backgroundColor = .purple
        case .win:
            gameStatusLabel.text = "Ты выиграл! Поздравляю🎉"
            self.view.backgroundColor = .green
        case .start:
            resetGameState()
        }
        
        playAgainButton.isHidden = false
        
        for char in [rockSignButton, paperSignButton, scissorsSignButton] {
            if char?.currentTitle != playerTurn.emojiSigh {
                char?.isHidden = true
            }
        }
    }
    
    func resetGameState() {
        self.view.backgroundColor = .lightGray
        
        playAgainButton.setTitle("Попробовать еще раз", for: .normal)
        
        gameStatusLabel.text = "Камень, Ножницы, Бумага?"
        appSignLabel.text = "🤖"
        playAgainButton.isHidden = true
        
        rockSignButton.isEnabled = true
        rockSignButton.isHidden = false
        
        paperSignButton.isEnabled = true
        paperSignButton.isHidden = false
        
        scissorsSignButton.isEnabled = true
        scissorsSignButton.isHidden = false
    }
}

