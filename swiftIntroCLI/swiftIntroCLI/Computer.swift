//
//  Computer.swift
//  swiftIntroCLI
//
//  Created by Etudiant on 03/05/2022.
//

import Foundation

class Computer {
    var screens: [Screen]
    var disks: [Disk]
    var rams: [String]
    let brand: String
    let model: String
    let gpu: String
    let cpu: String
    let psu: String
    let motherboard: String
    var description: String {
        return "Computer[\(self.screens), \(self.disks), \(self.rams), \(self.brand), \(self.model), \(self.gpu), \(self.cpu), \(self.psu), \(self.motherboard)]"
    }

    init(brand: String,
    model: String,
    gpu: String,
    cpu: String,
    motherboard: String,
    rams: [String],
    psu: String,
    disks: [Disk],
    screens: [Screen] = [])
    {
        self.brand = brand
        self.model = model
        self.gpu = gpu
        self.cpu = cpu
        self.psu = psu
        self.motherboard = motherboard
        self.rams = rams
        self.disks = disks
        self.screens = screens
    }
    
}


