//
//  Pixel.swift
//  swiftIntroCLI
//
//  Created by Etudiant on 03/05/2022.
//

import Foundation

struct Pixel {
    let height: Int
    let width: Int
    var description: String {
        return "{\(self.width), \(self.height)}" // equivalent du toString
    }

    static func to720p() -> Pixel {
        return Pixel(height: 720, width: 1920)
    }
    
    static func to1080p() -> Pixel {
        return Pixel(height: 1080, width: 1920)
    }
    
    static func to1440p() -> Pixel {
        return Pixel(height: 1440, width: 2560)
    }
    static func to4k() -> Pixel {
        return Pixel(height: 2160, width: 3840)
    }
}
// Struct genere automatiquement un constructeur


