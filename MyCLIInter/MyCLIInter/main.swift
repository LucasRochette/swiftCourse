//
//  main.swift
//  MyCLIInter
//
//  Created by Etudiant on 03/05/2022.
//

import Foundation

let p1 = Player(nickname: "Bob", score: -180)
let p2 = Player(nickname: "Luigi", score: 0)
let p3 = Player(nickname: "Paolo", score: 5)
let p4 = Player(nickname: "Paul", score: 5)

let g: Game = 9



if let winner = g.play(players: [p1,p2,p3,p4]) {
    print(winner.nickname)
}else{
    print("Pas de gagnant")
}


let a = 10.by2()
print(a)

