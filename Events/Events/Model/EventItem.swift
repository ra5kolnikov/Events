//
//  EventItem.swift
//  Events
//
//  Created by Виталий on 02.06.2023.
//

import Foundation

struct EventItem: Codable, Identifiable {
    
    let id: String
    let name: String
    let startTime: TimeInterval
    let endTime: TimeInterval
}
