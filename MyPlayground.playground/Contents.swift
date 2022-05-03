import UIKit

var greeting = "Hello, playground"
var greeting2: String = "Hello"
let constant: String = "valeur constante"
let a: Int = 10

var strConcat = greeting + " " + greeting2
var str = greeting + String(a)
var str2 = "\(greeting) \(a)"
var str3 = greeting + "\(a)"


var arr1: [String] = []

arr1.append(greeting)
arr1.append(greeting2)

arr1.append("")

//let arr2 = arr1 //immutable

var arr2 = arr1.map { str in
    return str.count
}
arr2


var dict: [String: Int] = [:]

dict["test"] = 80
dict["test2"] = 120




//let d = dict["test"]!

let d = dict["test"]
print(d)

// pour enlever l'optionnel, il faut faire obligatoirement un IF et créer une nouvelle variable
if let sup = d {
    print(sup)
}

//Autre cas pour enlever l'optionnel

if d != nil {
    let k: Int = d!
    print(k)
}
// Si c'est nul ça plante

let k2 = d ?? 5
print(k2)

