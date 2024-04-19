import Foundation

class UsersExemple {
    var all:[UserExemple] = [
        UserExemple(pseudo: "JMartin", firstName: "Jean", familyName: "Martin", isAdmin: true, password: "12345ABC"),
        UserExemple(pseudo: "MDupont", firstName: "Marie", familyName: "Dupont", isAdmin: true, password: "J@imeLesM0tsDeP@sseDifficiles")
    ]
}

struct UserExemple {
    let id = UUID()
    let pseudo: String
    let firstName: String
    let familyName: String
    let isAdmin: Bool
    let password: String
}
