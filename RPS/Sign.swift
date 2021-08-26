//
//  Sign.swift
//  RPS
//
//  Created by Иван Гребенюк on 25.08.2021.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}
enum Sign {
    case rock, paper, scissors
    
    var emojiSigh: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    func compareSigns(rivalSign: Sign) -> GameState {
        switch self {
        case .rock:
            switch rivalSign {
            case .rock:
                return .draw
            case .paper:
                return .lose
            case .scissors:
                return .win
            }
        case .paper:
            switch rivalSign {
            case .paper:
                return .draw
            case .scissors:
                return .lose
            case .rock:
                return .win
            }
        case .scissors:
            switch rivalSign {
            case .scissors:
                return .draw
            case .rock:
                return .lose
            case .paper:
                return .win
            }
        }
    }
}
