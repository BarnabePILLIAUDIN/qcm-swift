import CoreData
import Foundation

class DataController: ObservableObject {
    static var shared = DataController()
        
    let container = NSPersistentContainer(name: "Model")
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    private init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func saveUser(firstName: String,familyName:String,password:String,pseudo:String,isAdmin:Bool,grade:Int16 = -1) -> User? {
        let registeredUser = User(context: viewContext)
        registeredUser.id = UUID()
        registeredUser.firstName = firstName
        registeredUser.password = password
        registeredUser.familyName = familyName
        registeredUser.pseudo = pseudo
        registeredUser.isAdmin = isAdmin
        registeredUser.grade = grade
        
        
        do {
            try viewContext.save()
            return registeredUser
        } catch {
            print("Je n'ai pas réussi à sauvegarder les données: \(error)")
            return nil
        }
    }
    
    func removeUser(user: User) {
        viewContext.delete(user)
        do {
            try viewContext.save()
        } catch {
            print("Je n'ai pas réussi à sauvegarder les données: \(error)")
        }
    }
    
    func getAllUsers() -> [User] {
        let request = NSFetchRequest<User>(entityName: "User")

            do {
                return try viewContext.fetch(request)
            } catch {
                return []
            }
    }
}
