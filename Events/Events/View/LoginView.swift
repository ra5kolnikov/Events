//
//  LoginView.swift
//  Events
//
//  Created by Виталий on 02.06.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .ignoresSafeArea()
                    .foregroundColor(Color(CGColor(red: 0,
                                                   green: 0,
                                                   blue: 255,
                                                   alpha: 0.7)))
                VStack {
                    HeaderView(title: "Events",
                               subtitle: "Every Event for you!",
                               subtitleSize: 30,
                               angle: 45,
                               backgroundColor: .pink)
                    .offset(y: 70)
                    Form {
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                        }
                        
                        TextField("Email Address", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                        
                        ReuseableButton (
                            title: "Log In",
                            color: .blue
                        ) {
                            viewModel.login()
                        }
                        .padding(.bottom, 10)
                        .frame(height: 60)
                    }
                    .padding(.bottom, 60)
                    .frame(width: UIScreen.main.bounds.width, height: 270)
                    .scrollContentBackground(.hidden)
                    .offset(y: -70)
                    VStack {
                        Text("New around here?")
                        NavigationLink("Create an Account",
                                       destination: RegisterView())
                        .bold()
                        .foregroundColor(.red)
                        .padding(.bottom, 50)
                    }
                }
                .ignoresSafeArea(.keyboard, edges: .bottom)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
