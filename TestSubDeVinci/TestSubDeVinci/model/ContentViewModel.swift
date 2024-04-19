import Foundation

class ContentViewModel: ObservableObject {
    var storageModel = DataController.shared
    
    func deleteUser(user:User) {
        storageModel.removeUser(user:user)
    }
    
    func getAllUsers() -> [User] {
        storageModel.getAllUsers()
    }
    
}
    
