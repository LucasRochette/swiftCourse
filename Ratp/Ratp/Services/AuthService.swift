//
//  AuthService.swift
//  Ratp
//
//  Created by Lucas on 27/07/2022.
//

import Foundation

protocol AuthService {
    
    func AuthLogin(username:String, password: String, completion:(Bool) -> Void)

}
