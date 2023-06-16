//
//  MemberRepo.swift
//  Assignment6
//
//  Created by Abhinav Sunil on 5/16/23.
//

import Foundation

struct MemberRepo {
    static func load(auth: String) async throws -> [OtherMember] {
      //  print("Auth")
     //   print(auth)
       // sleep(1) 
        let url = URL(string: "https://cse118.com/api/v2/member")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept") // Set the Accept header
        request.setValue("Bearer \(auth)", forHTTPHeaderField: "Authorization") // Set the Authorization header

        let (data, _) = try await URLSession.shared.data(for: request)// Use the prepared request
//        if let jsonString = String(data: data, encoding: .utf8) {
//          //  print(jsonString)
//        }
        
        
        return try JSONDecoder().decode([OtherMember].self, from: data)
    }
    static func get(auth: String, id: String) async throws -> [OtherMember]{
      //  print("Auth")
     //   print(auth)
       // sleep(1)
        let url = URL(string: "https://cse118.com/api/v2/workspace/\(id)/member")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept") // Set the Accept header
        request.setValue("Bearer \(auth)", forHTTPHeaderField: "Authorization") // Set the Authorization header

        let (data, _) = try await URLSession.shared.data(for: request) // Use the prepared request
        
//        if let jsonString = String(data: data, encoding: .utf8) {
//          //  print(jsonString)
//        }
        
        return try JSONDecoder().decode([OtherMember].self, from: data)
    }
    
    static func delete(auth: String, wid: String, mid: String) async throws {
        let urlString = "https://cse118.com/api/v2/workspace/\(wid)/member"
        var urlComponents = URLComponents(string: urlString)
        
        let midQueryItem = URLQueryItem(name: "mid", value: mid)
        urlComponents?.queryItems = [midQueryItem]
        
        let url = urlComponents?.url
        var request = URLRequest(url: url!)
        
        
        request.setValue("application/json", forHTTPHeaderField: "Accept") // Set the Accept header
        request.setValue("Bearer \(auth)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "DELETE"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
    }
    
    static func add(auth: String, wid: String, mid: String) async throws {
        let urlString = "https://cse118.com/api/v2/workspace/\(wid)/member"
        var urlComponents = URLComponents(string: urlString)
        
        let midQueryItem = URLQueryItem(name: "mid", value: mid)
        urlComponents?.queryItems = [midQueryItem]
        
        let url = urlComponents?.url
        
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(auth)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        // Handle the response data as needed
    }
}
