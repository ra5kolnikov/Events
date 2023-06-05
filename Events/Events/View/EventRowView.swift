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
                
                Text("Start: \(item.start_time)")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
                Text("End: \(item.end_time)")
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
            id: "1", name: "Coffee break",
            start_time: "",
            end_time: "",
        url: ""))
    }
}
