//
//  main.swift
//  swiftIntroCLI
//
//  Created by Etudiant on 03/05/2022.
//

import Foundation

print("Hello, World!")

let screen1 = Screen(brand: "Apple",
model: "Pro Display XDR",
resolutions: [
    Pixel.to720p(),
    Pixel.to1080p(),
    Pixel.to1440p(),
    Pixel.to4k(),
    Pixel(height: 3102, width: 6560)
],
inputs: ["Alimentation"],
outputs: [
    "Thunderbolt 3"
])

let disk1 = Disk(brand: "Samsung",
model: "980 pro",
category: .nvme,
capacity: 1000)

let disk2 = Disk(brand: "WD",
model: "Black",
category: .ssd,
capacity: 8000)

let homeOffice = Computer(brand: "Apple", model: "Mac Studio", gpu: "M1 Ultra", cpu: "M1 Ultra", motherboard: "Apple MB", rams: ["64 Go unifiés", "64 Go unifiés"], psu: "none", disks: [disk1, disk2])

homeOffice.screens.append(screen1);
print(homeOffice.description)
