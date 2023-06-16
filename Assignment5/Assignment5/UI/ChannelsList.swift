//
//  ChannelsList.swift
//  Assignment5
//
//  Created by Abhinav Sunil on 5/9/23.
//
// Chat GPT wrote date conversions
import SwiftUI

struct ChannelsList: View {
  let workspace: Workspace
  let idateFormatter: DateFormatter
  init(workspace: Workspace) {
        self.workspace = workspace
        idateFormatter = DateFormatter()
        idateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        }
    
  
  var body: some View {
     VStack {
      List {
          ForEach(workspace.channels) {channel in
              let uniqueIds = Set(channel.messages.map { $0.member.id})
              let unique = uniqueIds.count
              let count = channel.messages.count
              let dates = channel.messages.compactMap { idateFormatter.date(from: $0.posted) }
              let recent = dates.max() ?? Date()
              let components = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: recent, to: Date())
              let minute = components.minute!
              let day = components.day!
              let hour = components.hour!
              let second = components.second!
              if day > 0 {
                  let final = "\(day) days"
                  NavigationLink(destination: MessagesList(channel: channel)) {
                      ChannelCard(channel: channel, unique: unique, count: count, recent: final)
                  }
              }
              else if hour > 0 {
                  let final = "\(hour) hours"
                  NavigationLink(destination: MessagesList(channel: channel)) {
                      ChannelCard(channel: channel, unique: unique, count: count, recent: final)
                  }
              }
              else if minute > 0 {
                  let final = "\(minute) mins"
                  NavigationLink(destination: MessagesList(channel: channel)) {
                      ChannelCard(channel: channel, unique: unique, count: count, recent: final)
                  }
              }
              else if second > 0 {
                  let final = "\(second) secs"
                  NavigationLink(destination: MessagesList(channel: channel)) {
                      ChannelCard(channel: channel, unique: unique, count: count, recent: final)
                  }
              }
              else {
                  let final = " "
                  NavigationLink(destination: MessagesList(channel: channel)) {
                      ChannelCard(channel: channel, unique: unique, count: count, recent: final)
                  }
              }
                        
        }
      }
         Spacer() // Add a spacer to fill the VStack
    }
     .navigationTitle("\(workspace.name)")
    .padding(0)
  }
}
