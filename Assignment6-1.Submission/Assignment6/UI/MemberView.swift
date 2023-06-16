import SwiftUI
//Chat GPT helped me with swipe actions
struct MemberView: View {
  @EnvironmentObject var model: ViewModel
    var body: some View {
         VStack {
             if model.otherWorkspaceMembers.isEmpty {
                 ProgressView()
             } else {
                 List {
                     ForEach(model.otherWorkspaceMembers) { member in
                         MemberCard(member: member).swipeActions {
                             Button(action: {
                                 model.deleteMemberWorkspace(mid: member.id.uuidString)
                             }, label: {
                                 Label("Delete", systemImage: "trash")
                             })
                             .tint(.red)
                         }
                     }
                 }
//                 .refreshable {
//                     model.getOtherWorkspaceMembers()
//                 }
             }
         }
    .onAppear {
        model.getOtherWorkspaceMembers()
    }
    .navigationBarTitle("Members")
    .navigationBarItems(trailing:
            NavigationLink(destination: AllMemberView()) {
            Image(systemName: "plus")
        }.accessibilityLabel("Add Member")
    )
            
  }
}
