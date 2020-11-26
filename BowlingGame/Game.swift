//
//  Game.swift
//  BowlingGame
//
//  Created by alexis on 20/11/20.
//

import Foundation

final class Game {
    
    private var rolls = [Int](repeating: 0, count: 21)
    private var currentRoll = 0
    
    func roll(_ pins: Int) {
        rolls[currentRoll] = pins
        currentRoll += 1
    }
    
    func score() -> Int{
        var score = 0
        var roll = 0
        for _ in 1...10 {
            //TODO: Seperate the board into innings with rolls 
            // when roll 1 = - and roll 2 = 10
            //Spare must be checked first, otherwise the Strike roll == 10 statement will break the score
            if isSpare(roll) {
                score += 10 + rolls[roll + 2]
                roll += 2
            } else if isStrike(roll) {
                score += 10 +
                    rolls[roll + 1] +
                    rolls[roll + 2]
                roll += 1
            } else {
                score += rolls[roll] + rolls[roll + 1]
                roll += 2
            }
        }
        return score
    }
    
    private func isSpare(_ roll: Int) -> Bool {
        rolls[roll] + rolls[roll + 1] == 10
    }
    
    private func isStrike(_ roll: Int) -> Bool {
        rolls[roll] == 10
    }
}
