//
//  Disk.swift
//  swiftIntroCLI
//
//  Created by Etudiant on 03/05/2022.
//

import Foundation

struct Disk {

    enum Category {
        case ssd
        case hdd
        case nvme
    }

    let brand: String
    let model: String
    let category: Category
    let capacity: Int
    var description: String {
        return "Disk[\(self.brand), \(self.model), \(self.capacity), \(self.category)]"
    }
}
