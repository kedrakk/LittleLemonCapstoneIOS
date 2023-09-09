//
//  UserProfile.swift
//  LittleLemonCapstoneIOS
//
//  Created by kedk on 9/2/23.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    @State private var firstName: String = (UserDefaults.standard.string(forKey: kFirstName) ?? "")
    @State private var lastName: String = (UserDefaults.standard.string(forKey: kLastName) ?? "")
    @State private var email: String = (UserDefaults.standard.string(forKey: kEmail) ?? "")
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            Text("Personal Information")
            Image("Profile").resizable().frame(width: 100,height: 100)
            AppTextView(label: "First Name", value: $firstName).disabled(true)
            AppTextView(label: "Last Name", value: $lastName).disabled(true)
            AppTextView(label: "Email", value: $email).disabled(true)
            AppButtonView(title: "Logout") {
                UserDefaults.standard.set(
                    false, forKey: kIsLoggedIn
                )
                showAlert = true
                self.presentation.wrappedValue.dismiss()
                
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Logout Success"))
            }
            Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
