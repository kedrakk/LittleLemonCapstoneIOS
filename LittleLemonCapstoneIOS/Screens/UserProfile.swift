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
    @State private var phoneNumber: String = "(217) 555-0113"
    @State private var showAlert = false
    
    @State var orderStatusChecked = true
    @State var passwordChangesChecked = true
    @State var specialOffersChecked = true
    @State var newLettersChecked = true
    
    let backAction:()->Void
    
    init(backAction: @escaping () -> Void) {
        self.backAction = backAction
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Personal Information")
                    .font(.karlaLeadText).bold()
                    .padding(.horizontal,10).padding(.vertical,15)
                Text("Avatar")
                    .font(.karlaParagraph).foregroundColor(.gray)
                    .padding(.horizontal,10)
                HStack{
                    Image("Profile").resizable().frame(width: 100,height: 100)
                    Button {
                        
                    } label: {
                        Text("Change")
                    }
                    .padding(10)
                    .background(Color.primaryBlue)
                    .cornerRadius(10)
                    .foregroundColor(.secondaryWhite)
                    .padding(.horizontal,10)
                    Button {
                        
                    } label: {
                        Text("Remove")
                    }
                    .padding(10)
                    .background(Color.secondaryWhite)
                    .border(Color.primaryBlue)
                    .cornerRadius(2)
                    .foregroundColor(.primaryBlue)
                }.padding(.horizontal,10)
                Section{
                    AppTextView(label: "First Name", value: $firstName).disabled(true)
                    AppTextView(label: "Last Name", value: $lastName).disabled(true)
                    AppTextView(label: "Email", value: $email).disabled(true)
                    AppTextView(label: "Phone Number", value: $phoneNumber).disabled(true)
                    Text("Email notifications")
                        .font(.karlaLeadText).bold()
                        .padding(.horizontal,10).padding(.top,15)
                    VStack(alignment: .leading){
                        Toggle(isOn: $orderStatusChecked) {
                            Text("Order Status")
                        }.toggleStyle(iOSCheckboxToggleStyle()).padding(.vertical,3)
                        Toggle(isOn: $passwordChangesChecked) {
                            Text("Password Changes")
                        }.toggleStyle(iOSCheckboxToggleStyle()).padding(.vertical,3)
                        Toggle(isOn: $specialOffersChecked) {
                            Text("Special Offers")
                        }.toggleStyle(iOSCheckboxToggleStyle()).padding(.vertical,3)
                        Toggle(isOn: $newLettersChecked) {
                            Text("Newletters")
                        }.toggleStyle(iOSCheckboxToggleStyle()).padding(.vertical,3)
                    }.padding(.horizontal,10).padding(.bottom,15)
                    AppButtonView(title: "Logout",action: {
                        UserDefaults.standard.set(
                            false, forKey: kIsLoggedIn
                        )
                        showAlert = true
                        self.presentation.wrappedValue.dismiss()
                    },isPrimary: false)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Logout Success"))
                    }
                }
                HStack(alignment: .center){
                    Spacer()
                    Button {
                        backAction()
                    } label: {
                        Text("Discard Changes")
                    }.padding(10)
                        .background(Color.secondaryWhite)
                        .cornerRadius(5)
                        .border(Color.primaryBlue)
                        .foregroundColor(.primaryBlue)
                    Button {
                        backAction()
                    } label: {
                        Text("Save Changes")
                    }.padding(10)
                        .background(Color.primaryBlue)
                        .cornerRadius(5)
                        .foregroundColor(.secondaryWhite)
                        .padding(.horizontal,10)
                    Spacer()
                }.padding(.horizontal,10).padding(.top,15)
            }
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(backAction:{})
    }
}
