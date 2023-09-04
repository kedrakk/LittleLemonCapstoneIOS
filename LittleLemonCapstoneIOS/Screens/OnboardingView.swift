//
//  OnboardingView.swift
//  LittleLemonCapstoneIOS
//
//  Created by kedk on 8/30/23.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var showAlert = false
    @State private var message: String = ""
    @State private var isLoggedIn = (UserDefaults.standard.bool(forKey: kIsLoggedIn) )

    
    var body: some View {
        NavigationStack {
            VStack{
                AppTextView(label: "First Name", value: $firstName)
                AppTextView(label: "Last Name", value: $lastName)
                AppTextView(label: "Email", value: $email)
                AppButtonView(title: "Register") {
                    if firstName.isEmpty || lastName.isEmpty || email.isEmpty
                    {
                        showAlert=true
                        message = "All fields must be filled"
                    }
                    else
                    {
                        UserDefaults.standard.set(
                            firstName, forKey: kFirstName
                        )
                        UserDefaults.standard.set(
                            lastName, forKey: kLastName
                        )
                        UserDefaults.standard.set(
                            email, forKey: kEmail
                        )
                        UserDefaults.standard.set(
                            true, forKey: kIsLoggedIn
                        )
                        isLoggedIn=true
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(message))
                }

            }
            .navigationTitle("Little Lemon")
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeView().environment(\.managedObjectContext, self.viewContext)
            }
        }
        
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
