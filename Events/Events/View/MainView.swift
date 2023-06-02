//
//  ContentView.swift
//  Events
//
//  Created by Виталий on 02.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            EventsListView(items: [EventItem(id: "ad", name: "Alen", startTime: Date().timeIntervalSince1970, endTime: Date().timeIntervalSince1970)])
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
