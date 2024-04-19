import SwiftUI

// Composant qui gère l'affichage de la question et des réponse ainsi que la vérification des réponeses
struct QuestionCard: View {
    let question:Question
   @Binding var answer: Bool?
    
    var body: some View {
        VStack{
            Text(" \(question.statement)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.bottom,10)
            // Affichage des réponses
            ForEach(0..<question.proposal.count) {index in
                HStack {
                    Text(question.proposal[index])
                        .font(.title3)
                        .padding(.vertical,5)
                }.onTapGesture {
                    answer = index == question.answer.rawValue - 1
                }
            }
        }
        .padding(.vertical,10)
        .padding(.horizontal, 15)
        .border(.black)
    }
}
