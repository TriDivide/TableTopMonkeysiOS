//
//  LoginView.swift
//  TTMonkeys
//
//  Created by Liam Smith on 14/06/2020.
//  Copyright © 2020 TriDivide. All rights reserved.
//

import SwiftUI


struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isNavigationBarHidden = true
    
    @State private var result: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                
                Button(action: {
                    self.doLogin()
                }) {
                    Text("Login")
                }
                
                NavigationLink(destination: SignupView()) {
                    Text("Sign Up")
                }
                
                Button(action: {
                    self.didForgetPassword()
                }) {
                    Text("Forgot Password")
                }
                
                Text(result)
            }
        }
    }
    
// MARK: Logic
    private func doLogin() {
        if email.isValidEmail() {
            guard password.count >= 6 else {
                result = RegistrationError.invalidPassword.localizedDescription
                return
            }
            
            UserModel.instance.doLogin(email: email, password: password) { error in
                if let error = error {
                    self.result = error.localizedDescription
                    return
                }
                self.result = "Successfully logged in."
            }
        }
        else {
            result = RegistrationError.invalidEmail.localizedDescription
        }
    }
    
    private func didForgetPassword() {
        guard email.isValidEmail() else {
            result = "Please enter your email address"
            return
        }
        
        UserModel.instance.forgotPassword(email: email) { error in
            if let error = error {
                self.result = error.localizedDescription
                return
            }
            self.result = "Sent a password reset email"
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
