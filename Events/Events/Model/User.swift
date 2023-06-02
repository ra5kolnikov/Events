//
//  User.swift
//  Events
//
//  Created by Виталий on 02.06.2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
