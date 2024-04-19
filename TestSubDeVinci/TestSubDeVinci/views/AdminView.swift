import SwiftUI

struct AdminView:View {
    let user: User
    
    var body : some View{
        Text("Bienvienu adminstateur \(user.firstName ?? "No name")")
    }
}
