//
//  WorkspaceCard.swift
//  Assignment5
//
//  Created by Abhinav Sunil on 5/9/23.
//

import SwiftUI

struct WorkspaceCard: View {
  var workspace: Workspace
  var unique: Int
  var count: Int
  var recent: String
  @State var uniq: String
  @State var counter: String
  @State var rec: String
    
  init(workspace: Workspace, unique: Int, count: Int, recent: String) {
        self.workspace = workspace
        self.unique = unique
        self._uniq = State(initialValue: "\(unique)")
        self.count = count
        self.recent = recent
        self._counter = State(initialValue: "\(count)")
        self._rec = State(initialValue: recent)
        }
  var body: some View {
//    Text("\(ballclub.name)")
    VStack(alignment: .leading) {
      Text("\(workspace.name)")
        HStack {
            Image("folder.fill").resizable().frame(width: 10, height: 10)
            TextField("count for \(workspace.name)", text: $counter)
                .disabled(true)
                .textFieldStyle(.plain)
                .font(.caption)
            Image("person.3.fill").resizable().frame(width: 10, height: 10)
            TextField("members active in \(workspace.name)", text: $uniq)
                .disabled(true)
                .textFieldStyle(.plain)
                .font(.caption)
            Image("clock.fill").resizable().frame(width: 10, height: 10)
            TextField("latest message in \(workspace.name)", text: $rec)
                .disabled(true)
                .textFieldStyle(.plain)
                .font(.caption)
        }
    }
    .padding(20)
  }
}
