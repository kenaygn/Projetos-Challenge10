//
//  User.swift
//  MVVM+Coordinator
//
//  Created by Kenay on 08/11/25.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var name: String
    var email: String

    init(id: UUID = UUID(), name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}
