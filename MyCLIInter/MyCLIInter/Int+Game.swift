//
//  Int+Game.swift
//  MyCLIInter
//
//  Created by Etudiant on 03/05/2022.
//

import Foundation


extension Int: Game {
    func play(players: [Player]) -> Player? {
        let nb = players.count - 1
        if nb < 0 {
            return nil
        }
        if self < 0 || self > nb {
            return nil
        }
        return players[self]
    }
    
}
