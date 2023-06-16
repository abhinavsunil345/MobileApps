//
//  MessageCard.swift
//  Assignment5
//
//  Created by Abhinav Sunil on 5/9/23.
//

// date conversion chatgpt generated

import SwiftUI

struct MessagesCard: View {
  var message: Message
    let inputDateFormatter = DateFormatter()
    let outputDateFormatter = DateFormatter()

    init(message: Message) {
        self.message = message
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        outputDateFormatter.dateFormat = "MMM d, yyyy 'at' h:mm a"
        }
  var body: some View {
    VStack(alignment: .leading) {
        Text("\(message.member.name)").bold()
        Text("\(message.content)")
       if let date = inputDateFormatter.date(from: message.posted) {
                        Text("\(outputDateFormatter.string(from: date))")
                            .font(.caption)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .offset(x: -5, y: -5).padding(4)
                    }
        
    }
  }
}
