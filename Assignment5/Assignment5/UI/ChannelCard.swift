//
//  ChannelCard.swift
//  Assignment5
//
//  Created by Abhinav Sunil on 5/9/23.
//

import SwiftUI

struct ChannelCard: View {
  var channel: Channel
  var unique: Int
  var count: Int
  var recent: String
  @State var uniq: String
  @State var counter: String
  @State var rec: String
  init(channel: Channel, unique: Int, count: Int, recent: String) {
        self.channel = channel
        self.unique = unique
        self._uniq = State(initialValue: "\(unique)")
        self.count = count
        self.recent = recent
        self._counter = State(initialValue: "\(count)")
        self._rec = State(initialValue: recent)
          }
  var body: some View {
    VStack(alignment: .leading) {
      Text("\(channel.name)")
        HStack {
            Image("envelope.fill").resizable().frame(width: 10, height: 10)
            TextField("count for \(channel.name)", text: $counter)
                .disabled(true)
                .textFieldStyle(.plain)
                .font(.caption)
            Image("person.3.fill").resizable().frame(width: 10, height: 10)
            TextField("members active in \(channel.name)", text: $uniq)
                .disabled(true)
                .textFieldStyle(.plain)
                .font(.caption)
            Image("clock.fill").resizable().frame(width: 10, height: 10)
            TextField("latest message in \(channel.name)", text: $rec)
                .disabled(true)
                .textFieldStyle(.plain)
                .font(.caption)
        }
    }
    .padding(10)
  }
}
