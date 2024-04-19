//
//  ContentView.swift
//  TestSubDeVinci
//
//  Created by Guillaume on 16/04/2024.
//

import SwiftUI

// Vue principale c'est elle qui gére le fait que l'utilisateur soit loggé ou non
struct MainScreen: View {
    @State var isLogged = false
    @State var user:User?
    
    var body: some View {
        VStack {
            if isLogged {
                if let unpackedUser = user{
                    // Comme l'état de la connexion est géré ici le plus simple est de mettre le boutton de déconnexion dans cette view
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
                    // On ne peut pas afficher la vue d'un utilisateur loggé si il n'y a pas d'utilisateur dans le state
                    Text("Une erreur est survenue, relancez l'aplication")
                }

            } else {
                // Si l'utilisateur n'est pas loggé on lui affiche les formulaire de connexion/inscription
                UnloggedView(isLogged: $isLogged,user:$user)
            }
            
        }
    }
}

#Preview {
    MainScreen()
}

