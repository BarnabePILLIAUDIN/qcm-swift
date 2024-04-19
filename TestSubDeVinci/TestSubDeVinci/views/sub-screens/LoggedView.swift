import SwiftUI

struct LoggedView:View {
    let user: User
    var body: some View {
            if user.isAdmin{
                AdminView(user: user)
            } else {
                UserView(user: user)
            }
                
        }
}
