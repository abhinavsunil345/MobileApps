//
//  WorkspaceRepo.swift
//  Assignment6
//
//  Created by Abhinav Sunil on 5/16/23.
//

import Foundation


struct MessageRepo {
    static func load(auth: String, id: String) async throws -> [Message] {
       // sleep(1) 
        let url = URL(string: "https://cse118.com/api/v2/channel/\(id)/message")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept") // Set the Accept header
        request.setValue("Bearer \(auth)", forHTTPHeaderField: "Authorization") // Set the Authorization header

        let (data, _) = try await URLSession.shared.data(for: request) // Use the prepared request
        
//        if let jsonString = String(data: data, encoding: .utf8) {
//            print(jsonString)
//        }
        
            return try JSONDecoder.javaScriptISO8601().decode([Message].self, from: data)
        
      //  return try JSONDecoder().decode([Message].self, from: data)
    }
    
    
    static func add(auth: String, id: String, content: String) async throws {
        let url = URL(string: "https://cse118.com/api/v2/channel/\(id)/message")!
        var request = URLRequest(url: url)
        let Content = ["content": content]
        let jsonData = try JSONEncoder().encode(Content)
        
        
        request.setValue("application/json", forHTTPHeaderField: "Accept") // Set the Accept header
        request.setValue("Bearer \(auth)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        
        
        let (data, _) = try await URLSession.shared.data(for: request) // Use the prepared request
        
//        if let jsonString = String(data: data, encoding: .utf8) {
//            print(jsonString)
//        }
        
        
        //let session = URLSession.shared
       // let task = session.dataTask(with: request) // ChatGPT
        //task.resume() //ChatGPT
    }
    
    static func delete(auth: String, id: String) async throws {
        let url = URL(string: "https://cse118.com/api/v2/message/\(id)")!
        var request = URLRequest(url: url)
        
        
        request.setValue("application/json", forHTTPHeaderField: "Accept") // Set the Accept header
        request.setValue("Bearer \(auth)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "DELETE"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
    }
    
    
}
