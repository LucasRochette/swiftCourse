//
//  ScoreGame.swift
//  MyCLIInter
//
//  Created by Etudiant on 03/05/2022.
//

import Foundation


class ScoreGame: Game {
    func play(players: [Player]) -> Player? {
        var maxIndex = -1
        var maxCount = 0
        for i in 0 ..< players.count {
            if maxIndex == -1 || players[i].score > players[maxIndex].score {
                maxIndex = i
                maxCount = 1
            }else if players[i].score == players[maxIndex].score {
                maxCount += 1
            }
        }
        if maxIndex == -1 || maxCount > 1 {
            return nil
        }
        return players[maxIndex]
    }
}

