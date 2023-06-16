//
//  MainView.swift
//  Assignment5
//
//  Created by Abhinav Sunil on 5/9/23.
//

import SwiftUI


extension Workspace {
  static func fromJSONResource(name: String) -> [Workspace] {
      let bundlePath = Bundle.main.path(forResource: "Workspaces", ofType: "json")!
      let jsonData = try! String(contentsOfFile: bundlePath).data(using: .utf8)!
      return try! JSONDecoder().decode([Workspace].self, from: jsonData)
  }
}
struct MainView: View {
  let workspaces = Workspace.fromJSONResource(name: "Workspaces")
  
  var body: some View {
    NavigationView {
      WorkspacesList(workspaces: workspaces)
    }
  }
}

