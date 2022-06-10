//
//  SignInView.swift
//  Timeline
//
//  Created by Bryan Bui on 2022-05-05.
//

import SwiftUI

struct SecureTextField: View {
    @State private var isSecure: Bool = true
    @Binding var userText: String
    
    var body: some View {
        if #available(iOS 15.0, *) {
            HStack {
                if isSecure {
                    SecureField("Enter Administrative Password", text: $userText)
                } else {
                    TextField("Enter Administrative Password", text: $userText)
                }
            }.overlay(alignment: .trailing) {
                Image(systemName: isSecure ? "eye.slash":"eye")
                    .onTapGesture {
                        isSecure.toggle()
                    }
            }
        } else { //Fallback if older version
            SecureField("Enter Administrative Password", text: $userText, onCommit: {
                print("WIN") //onCommit exists i guess
            }) //$data.passwordKeyed
        }
    }
}

struct passView: View {
    @Binding var data: clubFoundation.Data
    @Binding var isPassViewSet: Bool
    @Binding var isNewClubViewSet: Bool
    @Binding var noPass: Bool
    
    //lol
    @State private var tempPass: String = ""
    let buttonSize: CGFloat = 50
    
    var body : some View {
        VStack(alignment: .leading) {
            Section(header: Text("Login").font(Font.title.weight(.bold))) {
                HStack(alignment: .bottom) {
                    //enter password, text: pass must equal the key id
                    SecureTextField(userText: $tempPass)
                } .font(Font.headline.weight(.light)) //change font to smaller
            }
            
            //button
            Button(action: {
                if (tempPass == "testpassword") {
                    isPassViewSet = false
                    noPass = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Change `2.0` to the desired number of seconds.
                        isNewClubViewSet = true
                    }
                } //else
            }, label: {
                Text("Done")
                    .foregroundColor(.green)
                    .frame(width: self.buttonSize, height: self.buttonSize, alignment: .leading)
            })
            
        } .padding().padding() //adding some space around object
        .offset(y:-50).frame(alignment: .center) //changing position
        
    }

}
