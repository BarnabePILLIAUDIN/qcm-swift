import SwiftUI

struct AdminView:View {
    @StateObject var viewModel = AdminViewModel.shared
    
    let user: User
    
    var body : some View{
        if user.isAdmin{
            VStack{
                ScrollView{
                    Text("Les résultats de vos élèves sont")
                    ForEach(viewModel.students){student in
                        Text("\(student.firstName ?? "") \(student.familyName ?? ""): \(student.grade != -1 ? "\(student.grade)" : "En attente")")
                            .padding(10)
                    }
                }
            }.onAppear(){
                viewModel.fecthStudents()
            }
        }
    }
}
