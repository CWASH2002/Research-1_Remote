//   Added comment
//  ContentView.swift
//  Research-1
//
//  Created by Cameron Washington
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassowrd = 0
    @State private var showLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.white.ignoresSafeArea()
                VStack{
                    Text("CMACK LOGIN")
                        .font(.largeTitle)
                        .bold()
                        .padding(20)
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width:300,height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(15)
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width:300,height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(15)
                        .border(.red, width: CGFloat(wrongPassowrd))
                    
                    Button("Login"){
                        if username.lowercased() == "cmack2023"{
                            wrongUsername = 0
                            if password.lowercased() == "cmackpass"{
                                wrongPassowrd = 0
                                showLoginScreen = true
                            }
                            else{ wrongPassowrd = 2
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 40)
                    .background(Color.blue)
                    .cornerRadius(15)
                    
                    NavigationLink(destination: Text("You are logged in @\(username), how would you like to organize your tasks?"), isActive: $showLoginScreen){
                        EmptyView()
                    }
                    
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
