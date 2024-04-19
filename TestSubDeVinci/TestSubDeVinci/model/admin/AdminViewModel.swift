import Foundation

class AdminViewModel: ObservableObject{
    static let shared = AdminViewModel()
    var storageModel = DataController.shared
    
    @Published var students:[User] = []
    
    private init() {}
    
    func fecthStudents(){
        var result:[User] = []
        
        for user in storageModel.getAllUsers() {
            if !user.isAdmin{
                result.append(user)
            }
        }
        students = result
    }
}
