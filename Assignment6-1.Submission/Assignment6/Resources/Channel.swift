//
//  Channel.swift
//  Assignment5
//
//  Created by Abhinav Sunil on 5/8/23.
//

import Foundation

struct Channel: Identifiable, Decodable {
  let id: UUID
  let name: String
  let messages: Int
}
