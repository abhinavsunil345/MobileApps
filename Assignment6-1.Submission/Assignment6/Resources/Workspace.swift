
//
//  Workspaces.swift
//  Assignment5
//
//  Created by Abhinav Sunil on 5/8/23.
//

import Foundation

struct Workspace: Identifiable, Decodable {
  let name: String
  let id: UUID
  let owner: UUID
  let channels: Int
}
