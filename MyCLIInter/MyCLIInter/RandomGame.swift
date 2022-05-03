//
//  RandomGame.swift
//  MyCLIInter
//
//  Created by Etudiant on 03/05/2022.
//

import Foundation

class RandomGame: Game {
    func play(players: [Player]) -> Player? {
        let indexMax = players.count - 1
        if indexMax < 0 {
            return nil
        }
        let rand = Int.random(in: 0 ... indexMax)
        return players[rand]
    }
    
    
    
    
}
