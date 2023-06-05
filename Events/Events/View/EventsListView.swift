//
//  EventsTableView.swift
//  Events
//
//  Created by Виталий on 02.06.2023.
//

import SwiftUI

struct EventsListView: View {
    
    @StateObject var viewModel = EventsListViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.posts) { post in
                    NavigationLink(destination: DetailView(url: post.url)) {
                        EventRowView(item: post)
                    }
                }
                ReuseableButton(title: "Say Hello :)",
                                color: .green) {
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
                viewModel.fetchData()
                viewModel.fetchUser()
            }
            .navigationTitle("Your Events")
        }
    }
}

struct EventsListView_Previews: PreviewProvider {
    static var previews: some View {
        EventsListView()
    }
}
