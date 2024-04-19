import SwiftUI

struct UnloggedView:View {
    @Binding var isLogged:Bool
    @Binding var user: User?
    @State var showError = false
    @StateObject var viewModel = AuthViewModel.shared
    
    var body: some View {
        if showError {
            Text("Une erreur est survenue")
                .font(.largeTitle)
                .foregroundStyle(.red)
        }
        
        Form{
            Text("Connexion")
            TextField("Identifaiant", text: $viewModel.inputSignInPseudo)
            TextField("Mot de passe", text: $viewModel.inputSignInPassword)
            Button("Se connecter"){
                let userLogin = viewModel.signIn()
                if let userLogin{
                    user = userLogin
                    viewModel.resetSignInForm()
                    isLogged = true
                } else {
                    showError = true
                }
                
            }
        }
        Divider()
        Form{
            Text("Sign up")
            TextField("Prénom",text:$viewModel.inputSignUpFirstName)
            TextField("Nom de famille",text:$viewModel.inputSignUpFamilyName)
            TextField("Identifaiant",text: $viewModel.inputSignUpPseudo)
            TextField("Mot de passe", text: $viewModel.inputSignUpPassword)
            TextField("Confirmer le mot de passe", text: $viewModel.inputSignUpPassword2)
            Toggle(isOn: $viewModel.inputSignUpIsAdmin, label: {
            // N'aurait pas été là dans une vrai app mais cela permet de créer facilement des comptes admin
                Text("Compte administrateur")
            })
            Button("S'inscrire"){
                let newUser = viewModel.signUp()
                if let newUser{
                    user = newUser
                    isLogged = true
                    viewModel.resetSignUpForm()
                } else {
                    showError = true
                }
                
            }
        }
        
    }
}


