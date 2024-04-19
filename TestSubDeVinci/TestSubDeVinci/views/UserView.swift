import SwiftUI

struct UserView: View {
    @StateObject var viewModel = QuestionsViewModel.shared
    // Par defaut l'index est null. Il aura une valeur quand fetchQuestions sera terminé pour éviter un index out of range
    @State var index:Int?
    @State var answers: [Bool] = [Bool]()
    let user: User
    
    var body: some View {
        VStack{
            Text("Bonjour \(user.firstName ?? "") voici vos questions")
            Spacer()
                if let index {
                    QuestionCard(question: viewModel.questions[index], answer: $answers[index])
            }
            Spacer()
        }.onAppear() {
            viewModel.fetchQuestions()
            for _ in viewModel.questions{
                // On initialise le table contenant les réponse de l'utilisateur
                // Par défaut il a faux partout
                answers.append(false)
            }
            index = 0
        }.onChange(of: answers){
            print(answers)
            if var index{
                index = index  + 1
            }
        }
    }
}

