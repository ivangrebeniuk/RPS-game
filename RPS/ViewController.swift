//
//  ViewController.swift
//  RPS
//
//  Created by Иван Гребенюк on 25.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var currentState = GameState.start

    @IBOutlet weak var appSignLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var rockSignButton: UIButton!
    @IBOutlet weak var paperSignButton: UIButton!
    @IBOutlet weak var scissorsSignButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateGameState()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rockButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func paperButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func scissorsButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func playAgainButtonTapped(_ sender: UIButton) {
        updateGameState()
    }
    
    func updateGameState() {
        switch currentState {
        case .start:
            self.view.backgroundColor = .cyan
            
            gameStatusLabel.text = "Rock, Paper, Scissors?"
            appSignLabel.text = "🤖"
            playAgainButton.isHidden = true
            
            rockSignButton.isEnabled = true
            rockSignButton.isHidden = false
            
            paperSignButton.isEnabled = true
            paperSignButton.isHidden = false
            
            scissorsSignButton.isEnabled = true
            scissorsSignButton.isHidden = false
            
        default:
            print("hello")
        }
    }
}

