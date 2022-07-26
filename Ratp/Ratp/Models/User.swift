//
//  User.swift
//  Ratp
//
//  Created by Lucas on 26/07/2022.
//

import Foundation

class User {
    let username: String
    let email: String
    let password: String
    
    
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
    }
    
    func toJSON() -> [String: Any] {
        return [
            "username": self.username,
            "password": self.password
        ]
    }
    
    convenience init?(json: [String: Any]) {
        guard let username = json["username"] as? String,
              let password = json["password"] as? String
            else {
            return nil
        }
        self.init(username: username, password: password)
    }
    
}
