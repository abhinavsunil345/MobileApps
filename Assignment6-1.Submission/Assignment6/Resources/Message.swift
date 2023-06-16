//
//  Message.swift
//  Assignment5
//
//  Created by Abhinav Sunil on 5/8/23.
//

import Foundation


struct Message: Identifiable, Decodable {
  let content: String
  let posted: Date
  let id: UUID
  let member: UUID
}
