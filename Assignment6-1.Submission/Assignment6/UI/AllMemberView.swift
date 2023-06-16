import SwiftUI
//Chat GPT helped me with swipe actions
struct AllMemberView: View {
  @EnvironmentObject var model: ViewModel
    var body: some View {
         VStack {
             if model.otherMembers.isEmpty {
                 ProgressView()
             } else {
                 List {
                     ForEach(model.otherMembers) { member in
                         MemberCard(member: member).swipeActions {
                             Button(action: {
                                 model.addMember(mid: member.id.uuidString)
                             }, label: {
                                 Label("Add", systemImage: "person.badge.plus")
                             })
                             .tint(.green)
                         }
                     }
                 }
//                 .refreshable {
//                     model.getOtherMembers()
//                 }
             }
         }
    .onAppear {
        model.getOtherMembers()
    }
    .navigationBarTitle("Members")
            
  }
}
