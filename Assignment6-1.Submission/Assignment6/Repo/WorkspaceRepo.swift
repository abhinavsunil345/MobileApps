//
//  WorkspaceRepo.swift
//  Assignment6
//
//  Created by Abhinav Sunil on 5/16/23.
//

import Foundation


struct WorkspaceRepo {
    static func load(auth: String) async throws -> [Workspace] {
       // sleep(1) 
        let url = URL(string: "https://cse118.com/api/v2/workspace")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept") // Set the Accept header
        request.setValue("Bearer \(auth)", forHTTPHeaderField: "Authorization") // Set the Authorization header

        let (data, _) = try await URLSession.shared.data(for: request) // Use the prepared request
        
        
        return try JSONDecoder().decode([Workspace].self, from: data)
    }
    
    static func add(auth: String, name: String) async throws {
        let url = URL(string: "https://cse118.com/api/v2/workspace")!
        var request = URLRequest(url: url)
        let Name = ["name": name]
        let jsonData = try JSONEncoder().encode(Name)
        
        
        request.setValue("application/json", forHTTPHeaderField: "Accept") // Set the Accept header
        request.setValue("Bearer \(auth)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        
        
        let (data, _) = try await URLSession.shared.data(for: request) // Use the prepared request
        
//        if let jsonString = String(data: data, encoding: .utf8) {
//            print(jsonString)
//        }
        
    }
    
    static func delete(auth: String, id: String) async throws {
        let url = URL(string: "https://cse118.com/api/v2/workspace/\(id)")!
        var request = URLRequest(url: url)
        
        
        request.setValue("application/json", forHTTPHeaderField: "Accept") // Set the Accept header
        request.setValue("Bearer \(auth)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "DELETE"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
    }
    
    
    static func reset(auth: String) async throws {
        let url = URL(string: "https://cse118.com/api/v2/reset")!
        var request = URLRequest(url: url)
        
        
        request.setValue("application/json", forHTTPHeaderField: "Accept") // Set the Accept header
        request.setValue("Bearer \(auth)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "PUT"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) // ChatGPT
        try await task.resume() //ChatGPT
        
    }
    
    
    
}
