//
//  WorkspacesList.swift
//  Assignment5
//
//  Created by Abhinav Sunil on 5/8/23.
//
// Chat GPT wrote Date Conversions
import SwiftUI


struct WorkspacesList: View {
    let workspaces: [Workspace]
    let idateFormatter: DateFormatter
    init(workspaces: [Workspace]) {
        
        #if TESTING
        let testMember = Member(id: UUID(), name: "Big Bill")
        let formatter = ISO8601DateFormatter()
        let dateSec = Calendar.current.date(byAdding: .second, value: -20, to: Date())!
        let DateString = formatter.string(from: dateSec)
       // formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        let dateMin = Calendar.current.date(byAdding: .minute, value: -20, to: Date())!
        let DateStringMin = formatter.string(from: dateMin)
        let testMessage2 = Message(id: UUID(), content: "Blah Blah", posted: DateStringMin, member: testMember)
        let testChannel2 = Channel(id: UUID(), name: "Test Channel2", messages: [testMessage2])
        
        
        let dateHr = Calendar.current.date(byAdding: .hour, value: -2, to: Date())!
        let DateStringHr = formatter.string(from: dateHr)
        let testMessage3 = Message(id: UUID(), content: "Blah Blah", posted: DateStringHr, member: testMember)
        let testChannel3 = Channel(id: UUID(), name: "Test Channel3", messages: [testMessage3])
        
        let testMessage = Message(id: UUID(), content: "Blah Blah", posted: DateString, member: testMember)
        let testChannel = Channel(id: UUID(), name: "Test Channel", messages: [testMessage3, testMessage2, testMessage])
        
        
        // var testspace = workspaces
        // testspace.append(id: UUID(), name: "Test Workspace", channels: [testChannel])
        self.workspaces = workspaces + [Workspace(id: UUID(), name: "Test Workspace", channels: [testChannel])] + [Workspace(id: UUID(), name: "Test Workspace2", channels: [testChannel2])] + [Workspace(id: UUID(), name: "Test Workspace3", channels: [testChannel3])]
        #else
        self.workspaces = workspaces
        #endif
        
        idateFormatter = DateFormatter()
        idateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        }
    var body: some View {
        List {
            ForEach(workspaces) { workspace in
                let uniqueMembers = Set(workspace.channels.flatMap { $0.messages }.map { $0.member.id })
                let unique = uniqueMembers.count
                let count = workspace.channels.count
                let dates = workspace.channels.flatMap { $0.messages }.compactMap { idateFormatter.date(from: $0.posted) }
                let recent = dates.max() ?? Date()
                let components = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: recent, to: Date())
                let minute = components.minute!
                let day = components.day!
                let hour = components.hour!
                let second = components.second!
                
                if day > 0 {
                    let final = "\(day) days"
                    NavigationLink(destination: ChannelsList(workspace: workspace)) {
                        WorkspaceCard(workspace: workspace, unique: unique, count: count, recent: final)
                    }
                }
                else if hour > 0 {
                    let final = "\(hour) hours"
                    NavigationLink(destination: ChannelsList(workspace: workspace)) {
                        WorkspaceCard(workspace: workspace, unique: unique, count: count, recent: final)
                    }
                }
                else if minute > 0 {
                    let final = "\(minute) mins"
                    NavigationLink(destination: ChannelsList(workspace: workspace)) {
                        WorkspaceCard(workspace: workspace, unique: unique, count: count, recent: final)
                    }
                }
                else if second > 0 {
                    let final = "\(second) secs"
                    NavigationLink(destination: ChannelsList(workspace: workspace)) {
                        WorkspaceCard(workspace: workspace, unique: unique, count: count, recent: final)
                    }
                }
                else {
                    let final = " "
                    NavigationLink(destination: ChannelsList(workspace: workspace)) {
                        WorkspaceCard(workspace: workspace, unique: unique, count: count, recent: final)
                    }
                }
                
            }
        }
        .navigationTitle("Workspaces")
    }
}
