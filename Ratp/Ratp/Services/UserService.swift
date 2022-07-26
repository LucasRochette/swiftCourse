//
//  UserService.swift
//  Ratp
//
//  Created by Lucas on 27/07/2022.
//

import Foundation

protocol UserService {
    
    func save(_ user: User, completion: (Error?) -> Void)
    func load(completion: ([User]) -> Void)

}
