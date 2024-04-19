//
//  ContentView.swift
//  TestSubDeVinci
//
//  Created by Guillaume on 16/04/2024.
//

import SwiftUI

struct MainScreen: View {
    @State var isLogged = false
    @State var user:User?
    
    var body: some View {
        VStack {
            if isLogged {
                if let unpackedUser = user{
                    HStack{
                        Spacer()
                        Button("Se déconnecter"){
                            isLogged = false
                            user = nil
                        }
                        .padding(.trailing,10)
                        .padding(.bottom)
                    }
                    LoggedView(user:unpackedUser)
                } else{
                    Text("Une erreur est survenue, relancez l'aplication")
                }

            } else {
                UnloggedView(isLogged: $isLogged,user:$user)
            }
            
        }
    }
}

#Preview {
    MainScreen()
}

