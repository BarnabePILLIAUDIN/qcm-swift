import Foundation

class QuestionsViewModel:ObservableObject{
    var model = Model.shared
    static var shared = QuestionsViewModel()
    
    @Published var questions:[Question] = []
    
    private init (){}
    
  
    
    func fetchQuestions(){
        questions = model.questions
    }
    
}
