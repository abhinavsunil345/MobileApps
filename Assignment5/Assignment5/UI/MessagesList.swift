//
//  MessagesList.swift
//  Assignment5
//
//  Created by Abhinav Sunil on 5/9/23.
//
// ChatGPT wrote Sort function
import SwiftUI

struct MessagesList: View {
  let channel: Channel
  var body: some View {
    VStack() {
      List {
          let sortedMessages = channel.messages.sorted { $0.posted > $1.posted }
          ForEach(sortedMessages) {message in
              NavigationLink(destination: IndiMessage(message: message)) {
                  MessagesCard(message: message)
              }
        }
      }
    }
    .navigationTitle("\(channel.name)")
    .padding(0)
  }
}
