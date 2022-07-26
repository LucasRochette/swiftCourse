//
//  LoginService.swift
//  Ratp
//
//  Created by Lucas on 27/07/2022.
//

import Foundation

class LoginService : AuthService {
    
    public static let shared: AuthService = LoginService()
    
  
    
    func AuthLogin(username: String, password: String, completion: (Bool) -> Void) {
        
        if let clientID = ProcessInfo.processInfo.
            environment["API_URL"] {
                        //
        }
        else{
            
        }
        let url = URL(string: "http://localhost:3000/api/auth/login") else {
            completion(false)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: Any] = [
            "login": username,
            "password": password
        ]
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        } catch let error {
            print(error.localizedDescription)
            completion(false)
            return
        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Post Request Error: \(error.localizedDescription)")
                completion(false)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  200 == httpResponse.statusCode else {
                print("Invalid Response received from the server: \((response as? HTTPURLResponse)!.statusCode)")
                completion(false)
                return
            }
            let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let filePath = URL(fileURLWithPath: "token.txt", relativeTo: urls[0])
            print(filePath)
            do {
                let responseData = data
                guard let json = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments) as? [String: Any] else {
                    print("Json Serialization failed")
                    completion(false)
                    return
                }
                guard let user = Token(dict: json) else {
                    print("Mapping Json to User failed")
                    completion(false)
                    return
                }
                try user.access_token.write(to: filePath, atomically: true, encoding: String.Encoding.utf8)
                completion(true)
            } catch {
                completion(false)
            }
        }
        task.resume()
    }
    
}
