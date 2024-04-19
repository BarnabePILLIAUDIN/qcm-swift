//
//  Users.swift
//  TestSubDeVinci
//
//  Created by Guillaume on 19/04/2024.
//

import Foundation

// C'est ici pour l'exemple. Les utilisateurs seront à ajouter au CoreData
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
