//
//  LoginView.swift
//  Assignment6
//
//  Created by Abhinav Sunil on 5/15/23.
//
// Textfields and secure fields created by chatgpt
import SwiftUI


struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        VStack {
            Text("CSE118 Assignment 6")
            Image("SlugLogo")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 150, height: 150)
              .clipped()
            TextField("EMail", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding().autocapitalization(.none)
                            .onChange(of: username) { newValue in
                                model.loginCred = LoginCredentials(email: newValue, password: model.loginCred?.password ?? "")
                            }
                        
            SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding().autocapitalization(.none)
                            .onChange(of: password) { newValue in
                                model.loginCred = LoginCredentials(email: model.loginCred?.email ?? "", password: newValue)
                            }
            
            Button(action: login) {
                Text("Login")
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    private func login() {
        model.getMember()
    }

    
}


