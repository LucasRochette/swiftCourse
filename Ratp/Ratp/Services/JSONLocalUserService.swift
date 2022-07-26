//
//  JSONLocalUserService.swift
//  Ratp
//
//  Created by Lucas on 27/07/2022.
//

import Foundation

class JSONLocalUserService: UserService {
    
    static let shared = JSONLocalUserService()
    
    func save(_ user: User, completion: (Error?) -> Void) {
        self.load { users in
            var allUsers = users
            if let index = allUsers.firstIndex(where: { u in
                u.username == user.username
            }) {
                allUsers[index] = user
            } else {
                allUsers.append(user)
            }
            let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let filePath = URL(fileURLWithPath: "user.json", relativeTo: urls[0])
            do {
                let userArray = allUsers.map { u in
                    u.toJSON()
                }
                let data = try JSONSerialization.data(withJSONObject: userArray, options: .fragmentsAllowed)
                try data.write(to: filePath)
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
    
    func load(completion: ([User]) -> Void) {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let filePath = URL(fileURLWithPath: "user.json", relativeTo: urls[0])
        do {
            let data = try Data(contentsOf: filePath)
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let userArray = json as? [[String: Any]] {
                let users = userArray.compactMap({ dict in
                    User(json: dict)
                })
                completion(users)
            } else {
                completion([])
            }
        } catch {
            completion([])
        }
    }
    
}
