import Foundation

class AdminViewModel: ObservableObject{
    static let shared = AdminViewModel()
    var storageModel = DataController.shared
    
    @Published var students:[User] = []
    
    private init() {}
    
    func fecthStudents(){
        let users:[User] = storageModel.getAllUsers()
        var result:[User] = []
        
        for user in users {
            if !user.isAdmin{
                print(user)
                result.append(user)
            }
        }
        students = result
    }
}
