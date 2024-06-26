import SwiftUI


// Cette vue est affiché que si l'utilisateur n'est pas loggé
// Elle contient un formulaire pour s'enrigistrer et un pour se connecter
struct UnloggedView:View {
    @Binding var isLogged:Bool
    @Binding var user: User?
    @State var error = ""
    @StateObject var viewModel = AuthViewModel.shared
    
    var body: some View {
        if error.count > 0 {
            Text(error)
                .font(.largeTitle)
                .foregroundStyle(.red)
        }
        Form{
            Text("Connexion")
            TextField("Identifaiant", text: $viewModel.inputSignInPseudo)
            SecureField("Mot de passe", text: $viewModel.inputSignInPassword)
            Button("Se connecter"){
                let result = viewModel.signIn()
                let userLogin = result.0
                let errorString = result.1
                if let userLogin{
                    user = userLogin
                    viewModel.resetSignInForm()
                    isLogged = true
                } else {
                    error = errorString
                }
                
            }
        }
        Divider()
        Form{
            Text("Sign up")
            
            TextField("Prénom",text:$viewModel.inputSignUpFirstName)
            TextField("Nom de famille",text:$viewModel.inputSignUpFamilyName)
            TextField("Identifaiant",text: $viewModel.inputSignUpPseudo)
            SecureField("Mot de passe", text: $viewModel.inputSignUpPassword)
            SecureField("Confirmer le mot de passe", text: $viewModel.inputSignUpPassword2)
            Toggle(isOn: $viewModel.inputSignUpIsAdmin, label: {
            // N'aurait pas été là dans une vrai app mais cela permet de créer facilement des comptes admin
                Text("Compte administrateur")
            })
            Button("S'inscrire"){
                let result = viewModel.signUp()
                let newUser = result.0
                let errorString = result.1
                if let newUser{
                    user = newUser
                    isLogged = true
                    viewModel.resetSignUpForm()
                } else {
                    error = errorString
                }
                
            }
        }
        
    }
}


