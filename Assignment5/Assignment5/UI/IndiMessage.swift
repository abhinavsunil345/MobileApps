//
//  Message.swift
//  Assignment5
//
//  Created by Abhinav Sunil on 5/9/23.
//

import SwiftUI

struct IndiMessage: View {
  let message: Message
  var body: some View {
    VStack() {
        List {
            MessageCard(message: message)
        }
    }
    .navigationTitle("\(message.member.name)")
    .padding(0)
  }
}
