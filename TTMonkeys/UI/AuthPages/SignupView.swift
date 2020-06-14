//
//  SignupView.swift
//  TTMonkeys
//
//  Created by Liam Smith on 14/06/2020.
//  Copyright © 2020 TriDivide. All rights reserved.
//

import SwiftUI


struct SignupView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var result = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $firstName)
                TextField("Email Address", text: $email)
                SecureField("Password", text: $password)
                SecureField("Confirm Password", text: $password)
                
                Button(action: {
                    self.doSignUp()
                }) {
                    Text("Sign Up")
                }

                
                Text(result)
            }
        }
    }
    
    private func doSignUp() {
        guard firstName.count > 0 else {
            result = "Please enter a first name."
            return
        }
        
        guard lastName.count > 0 else {
            result = "Please enter a last name."
            return
        }
        
        guard email.isValidEmail() else {
            result = "Please enter a valid email address."
            return
        }
        
        guard password.count >= 6 else {
            result = "Please enter a password thats 6 characters or more."
            return
        }
        
        guard password == confirmPassword else {
            result = "Please confirm your password."
            return
        }
        
        UserModel.instance.doSignUp(email: email, firstName: firstName, lastName: lastName, password: password) { error in
            if let error = error {
                self.result = error.localizedDescription
                return
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
