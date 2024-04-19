import SwiftUI

struct QuestionCard: View {
    let question:Question
   @Binding var answer: Bool?
    
    var body: some View {
        VStack{
            Text(" \(question.statement)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.bottom,10)
            
            ForEach(0..<question.proposal.count) {index in
                HStack {
                    Text(question.proposal[index])
                        .font(.title3)
                        .padding(.vertical,5)
                }.onTapGesture {
                    print(index)
                    if index == question.answer.rawValue - 1{
                        answer = true
                    } else {
                        answer = false
                    }
                }
            }
        }
        .padding(.vertical,10)
        .padding(.horizontal, 15)
        .border(.black)
    }
}
