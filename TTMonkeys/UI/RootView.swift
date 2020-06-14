//
//  RootView.swift
//  TTMonkeys
//
//  Created by Liam Smith on 14/06/2020.
//  Copyright © 2020 TriDivide. All rights reserved.
//

import SwiftUI


struct RootView: View {
    @State var isLoggedIn = false
    
    var body: some View {
        Group {
            isLoggedIn ? AnyView(CampaignsView()): AnyView(LoginView())
        }.onReceive(UserModel.instance.loginStatus) {
            self.isLoggedIn = $0
        }.onAppear(perform: {
            let _ = UserModel.instance.isLoggedIn()
        })
    }
}
