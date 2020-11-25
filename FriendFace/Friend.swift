//
//  Friend.swift
//  FriendFace
//
//  Created by Juliette Rapala on 11/23/20.
//

import Foundation

struct Friend: Identifiable, Codable {
    var id = UUID()
    let name: String
}
