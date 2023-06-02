//
//  EventsTableView.swift
//  Events
//
//  Created by Виталий on 02.06.2023.
//

import SwiftUI

struct EventsListView: View {
    
    @StateObject var viewModel = EventsListViewViewModel()
    var items: [EventItem]
    
    var body: some View {
        VStack {
            List(items) { item in
                EventRowView(item: item)
            }
            ReuseableButton(title: "Say Hello :)",
                            color: .yellow) {
                viewModel.showAlert = true
            }
            .frame(width: UIScreen.main.bounds.width - 10 ,height: 50)
            .padding(.bottom, 10)
            
            ReuseableButton(title: "Log Out",
                            color: .red) {
                viewModel.logOut()
            }
            .frame(width: UIScreen.main.bounds.width - 10 ,height: 50)
            .padding(.bottom, 10)
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Hello \(viewModel.userName)"),
                  message: Text("Welcome to Events book my friend :)."))
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

struct EventsListView_Previews: PreviewProvider {
    static var previews: some View {
        EventsListView(items: [
            EventItem(id: "123",
                      name: "Coffee",
                      startTime: Date().timeIntervalSince1970,
                      endTime: Date().timeIntervalSince1970),
            EventItem(id: "231",
                      name: "Sleep",
                      startTime: Date().timeIntervalSince1970,
                      endTime: Date().timeIntervalSince1970),
            EventItem(id: "123",
                      name: "Coffee",
                      startTime: Date().timeIntervalSince1970,
                      endTime: Date().timeIntervalSince1970),
            EventItem(id: "231",
                      name: "Sleep",
                      startTime: Date().timeIntervalSince1970,
                      endTime: Date().timeIntervalSince1970),
            EventItem(id: "123",
                      name: "Coffee",
                      startTime: Date().timeIntervalSince1970,
                      endTime: Date().timeIntervalSince1970),
            EventItem(id: "231",
                      name: "Sleep",
                      startTime: Date().timeIntervalSince1970,
                      endTime: Date().timeIntervalSince1970)
        ])
    }
}
