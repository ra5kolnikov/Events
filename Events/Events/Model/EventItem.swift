//
//  EventItem.swift
//  Events
//
//  Created by Виталий on 02.06.2023.
//

import Foundation

struct EventItem: Decodable, Identifiable {
    
    var id: String?
    let name: String
    var start_time: String
    var end_time: String
    let url: String
}
