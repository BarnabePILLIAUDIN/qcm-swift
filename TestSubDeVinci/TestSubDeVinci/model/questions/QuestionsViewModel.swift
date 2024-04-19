import Foundation

class QuestionsViewModel:ObservableObject{
    var model = Model.shared
    var storageModel = DataController.shared
    
    static var shared = QuestionsViewModel()
    
    @Published var questions:[Question] = []
    
    private init (){
    }
    
    func fetchQuestions() {
        questions = model.questions
    }
    
    func setUserGrade(grade: Int16, user:User){
        // On vérifie que tout les champs de l'utilisateur on une valeur
        if  let firstName = user.firstName,
            let familyName = user.familyName,
            let password = user.password,
            let pseudo = user.pseudo {
            
            let users = storageModel.getAllUsers()
            
            // On supprime l'ancienne version de l'utilisateur
            for currentUser in users {
                if user == currentUser{
                    storageModel.removeUser(
                        user: user
                    )
                }
            }
            
            // On sauvegarde la nouvelle
            storageModel.saveUser(
                firstName: firstName,
                familyName: familyName,
                password: password,
                pseudo: pseudo,
                isAdmin: user.isAdmin,
                grade: grade
            )
        }
    }
    
}
