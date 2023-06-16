//
//  LoginRepo.swift
//  Assignment6
//
//  Created by Abhinav Sunil on 5/16/23.
//

import Foundation

// error handling is CHAT GPT CREATED

struct LoginRepo {
    static func login(email: String, password: String) async throws -> Member {
        let url = URL(string: "https://cse118.com/api/v2/login")!
        let credentials = ["email": email, "password": password]
        let jsonData = try JSONEncoder().encode(credentials)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            let httpResponse = response as? HTTPURLResponse
            if httpResponse!.statusCode == 200 {
                               // Login successful
                               print("Login successful")
                               return try JSONDecoder().decode(Member.self, from: data)
                           }
                           
                           // Login failed
            print("Login failed: \(httpResponse!.statusCode)")
                           throw LoginError.failed
        } catch {
            // Handle any errors that occur during the network request
            throw error
        }
    }
    
    enum LoginError: Error {
        case failed
        case invalidResponse
    }
}



//private func login(email: String, username: String) {
//    let url = URL(string: "https://cse118.com/api/v2/login")!
//
//    let credentials = ["email": username, "password": password]
//
//    do {
//        let jsonData = try JSONEncoder().encode(credentials)
//       // print(jsonData)
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = jsonData
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.data(with: request) { data, response, error in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//
//            if let response = response as? HTTPURLResponse {
//                if response.statusCode == 200 {
//
//                    // Login successful
//                    print("Login successful")
//                    if let data = data {
//                        return try JSONDecoder().decode(Member.self, from: data)
//                        }
//
//                } else {
//                    // Login failed
//                    print("Login failed: \(response.statusCode)")
//                }
//            }
//        }.resume()
//    } catch {
//        print("Failed to encode credentials: \(error)")
//    }
//}
