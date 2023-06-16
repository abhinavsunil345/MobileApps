//
//  LoginResponse.swift
//  Assignment6
//
//  Created by Abhinav Sunil on 5/15/23.
//

import Foundation

struct Member: Identifiable, Decodable {
  let id: UUID
  let name: String
  let accessToken: String
}
