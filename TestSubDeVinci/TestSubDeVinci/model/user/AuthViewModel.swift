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
    
    // Pour les fontions suivante on retourne un user qui correspone à l'utilisateur qui vient de se connecter
    // Et une string qui représente le message d'erreur. Une string vide veut dire qu'il n'y a pas d'erreurs
    
    func signIn() -> (User?,String) {
        // On vérifie que les champs ne sont pas vides
        if inputSignInPseudo == "" || inputSignInPassword == ""{
            
            return (nil, "Merci de remplir tout les champs du formulaire")
        }
        
        // On verifie que l 'utilisateur éxiste
        for user in storageModel.getAllUsers() {
            if user.pseudo == inputSignInPseudo && user.password == inputSignInPassword{
                
                return (user,"")
            }
        }
        
        return (nil,"Utilisateur inconnu")
    }
    
    func signUp()-> (User?,String) {
        // On vérifie que les inputs sont bien remplis
        if inputSignUpFirstName == "" || inputSignUpFamilyName == "" || inputSignUpPseudo == "" || inputSignUpPassword == "" || inputSignUpPassword2 == "" {
            
            return (nil, "Merci de remplir tout les champs du formulaire")
        }
        
        // On vérifie que les mots de passes correspondent
        if inputSignUpPassword != inputSignUpPassword2{
            
            return (nil,"Les mots de passes ne correspondent pas")
        }
        
        // On vérifie que le pseudo n'est pas déjà pris
        for user in storageModel.getAllUsers(){
            if user.pseudo == inputSignUpPseudo {
                return (nil,"Vous avez déjà un compte connectez vous")
            }
        }
        
        // Si tout est bon on retourne l'utilisateur
        return (storageModel.saveUser(firstName: inputSignUpFirstName, familyName: inputSignUpFamilyName, password: inputSignUpPassword, pseudo: inputSignUpPseudo, isAdmin: inputSignUpIsAdmin),"")
    }
}
