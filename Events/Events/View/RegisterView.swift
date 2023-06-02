//
//  RegisterView.swift
//  Events
//
//  Created by Виталий on 02.06.2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Register",
                       subtitle: "start being in the center of events",
                       subtitleSize: 20,
                       angle: 45,
                       backgroundColor: .orange)
            .offset(y: 30)
            //Login Form
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .autocapitalization(.none)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                SecureField("Confirm the password", text: $viewModel.confirmedPassword)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                ReuseableButton (
                    title: "Register",
                    color: .green
                ) {
                    viewModel.register()
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            .scrollContentBackground(.hidden)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
