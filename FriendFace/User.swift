//
//  User.swift
//  FriendFace
//
//  Created by Juliette Rapala on 11/23/20.
//

import Foundation

struct User: Identifiable, Codable {
    var id = UUID()
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}
