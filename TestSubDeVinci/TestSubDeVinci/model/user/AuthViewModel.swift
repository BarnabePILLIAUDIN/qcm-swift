import Foundation


class AuthViewModel: ObservableObject{
    static let shared = AuthViewModel()
    
    var storageModel = DataController.shared
    
    @Published var inputSignInPseudo: String = ""
    @Published var inputSignInPassword: String = ""
    
    @Published var inputSignUpFirstName: String = ""
    @Published var inputSignUpFamilyName: String = ""
    @Published var inputSignUpPassword: String = ""
    @Published var inputSignUpPseudo: String = ""
    @Published var inputSignUpPassword2: String = ""
    @Published var inputSignUpIsAdmin: Bool = false
   
    private init(){}
   
    
    func resetSignInForm(){
        inputSignInPseudo = ""
        inputSignInPassword = ""
    }
    
    func resetSignUpForm(){
        inputSignUpFirstName = ""
        inputSignUpFamilyName = ""
        inputSignUpPassword = ""
        inputSignUpPassword2 = ""
        inputSignUpPseudo = ""
    }
    
    func signIn() -> (User?,String) {
        if inputSignInPseudo == "" || inputSignInPassword == ""{
            return (nil, "Merci de remplir tout les champs du formulaire")
        }
        
        for user in storageModel.getAllUsers() {
            if user.pseudo == inputSignInPseudo && user.password == inputSignInPassword{
                return (user,"")
            }
        }
        return (nil,"Utilisateur inconnu")
    }
    
    func signUp()-> (User?,String) {
        if inputSignUpFirstName == "" || inputSignUpFamilyName == "" || inputSignUpPseudo == "" || inputSignUpPassword == "" || inputSignUpPassword2 == "" {
            return (nil, "Merci de remplir tout les champs du formulaire")
        }
        
        if inputSignUpPassword != inputSignUpPassword2{
            return (nil,"Les mots de passes ne correspondent pas")
        }
        
        for user in storageModel.getAllUsers(){
            if user.pseudo == inputSignUpPseudo {
                return (nil,"Vous avez déjà un compte connectez vous")
            }
        }
        
        return (storageModel.saveUser(firstName: inputSignUpFirstName, familyName: inputSignUpFamilyName, password: inputSignUpPassword, pseudo: inputSignUpPseudo, isAdmin: inputSignUpIsAdmin),"")
    }
}
