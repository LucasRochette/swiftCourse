//
//  Screen.swift
//  swiftIntroCLI
//
//  Created by Etudiant on 03/05/2022.
//

import Foundation

class Screen: CustomStringConvertible {
    let resolutions: [Pixel]
    let inputs: [String]
    let outputs: [String]
    let htz: Int?
    let brand: String
    let model: String


    
    var description : String {
        var fields: [String] = []
        fields.append(self.resolutions.description)
        fields.append(self.inputs.description)
        fields.append(self.outputs.description)
        fields.append(self.brand)
        fields.append(self.model)
            if let h = self.htz {
        fields.append(h.description)
    }
    return "Screen[\(fields.joined(separator: "/"))]"
    }
    


    init(brand:String,
         model:String,
         resolutions: [Pixel],
         inputs: [String],
         outputs: [String],
         htz: Int? = nil) {
        self.resolutions = resolutions
        self.brand = brand
        self.model = model
        self.inputs = inputs
        self.outputs = outputs
        self.htz = htz
    }

}
