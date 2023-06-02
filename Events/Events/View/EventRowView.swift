//
//  EventCellView.swift
//  Events
//
//  Created by Виталий on 02.06.2023.
//

import SwiftUI

struct EventRowView: View {
    
    @StateObject var viewModel = EventRowViewViewModel()
    let item: EventItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.body)
                    .bold()
                    .padding(.bottom)
                
                Text("Start: \(Date(timeIntervalSince1970: item.startTime).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
                Text("End: \(Date(timeIntervalSince1970: item.startTime).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
        }
    }
}

struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView(item: EventItem(
            id: "123",
            name: "Coffee break",
            startTime: Date().timeIntervalSince1970,
            endTime: Date().timeIntervalSince1970))
    }
}
