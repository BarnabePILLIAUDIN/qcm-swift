import SwiftUI

struct UserView: View {
    @StateObject var viewModel = QuestionsViewModel.shared
    // Par defaut l'index est null. Il aura une valeur quand fetchQuestions sera terminé pour éviter un index out of range
    @State var index:Int?
    @State var answers: [Bool?] = [Bool?]()
    let user: User
    
    var body: some View {
        VStack{
            Text("Bonjour \(user.firstName ?? "") voici vos questions")
            Spacer()
      
            if let index {
                // On check si il reste des questions
                if index < viewModel.questions.count {
                    // On vérifie que l'utilisateur n'ai pas encore répondu
                    // Une note de -1 signifie que l'utilisateur n'a pas répondu au questionaire
                    if user.grade == -1 {
                        Text("Question \(index + 1)/\(viewModel.questions.count)")
                        QuestionCard(question: viewModel.questions[index], answer: $answers[index])
                    }
                    // Sinon on informe l'utilisateur que il a finit
                        else {
                            Text("Vous avez déjà répondu au questionnaire les résultats vous seront communiquer bientôt")
                        }
                    // Si il a déjà fait le questionnaire il n'a pas le droit de le refaire
                    } else {
                        Text("Merci d'avoir répondu au questionnaire !")
                        Text("Votre score est de \(getScore())/\(viewModel.questions.count)")
                        Text("Vous pouvez vous déconnecter")
                    }
                }
            Spacer()
        }.onAppear() {
            viewModel.fetchQuestions()
            for _ in viewModel.questions{
                // On initialise le table contenant les réponse de l'utilisateur
                // Par défaut il est nil partout
                answers.append(nil)
            }
        }.onChange(of: answers){
            // On met -1 comme valeur si index est nil pour que l'index par défaut soit 0
            index = (index ?? -1)  + 1
            if index == viewModel.questions.count {
                viewModel.setUserGrade(grade: getScore(), user: user)
            }
        }
    }
    
    func getScore() -> Int16{
        var count:Int16 = 0
        
        for answer in answers{
            if answer==true {
                count+=1
            }
        }
        
        return count
    }
}

