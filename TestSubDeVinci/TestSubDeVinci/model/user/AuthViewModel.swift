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
    
    func signIn() -> User? {
        for user in storageModel.getAllUsers() {
            if user.pseudo == inputSignInPseudo && user.password == inputSignInPassword{
                return user
            }
        }
        return nil
    }
    
    func signUp()-> User? {
        if inputSignUpPassword != inputSignUpPassword2{
            return nil
        }
        
        for user in storageModel.getAllUsers(){
            if user.pseudo == inputSignUpPseudo {
                return nil
            }
        }
        
        return storageModel.saveUser(firstName: inputSignUpFirstName, familyName: inputSignUpFamilyName, password: inputSignUpPassword, pseudo: inputSignUpPseudo, isAdmin: inputSignUpIsAdmin)
    }
}
