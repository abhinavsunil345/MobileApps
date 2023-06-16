import SwiftUI

struct MemberCard: View {
  @EnvironmentObject var model: ViewModel
  let member: OtherMember
  var body: some View {
    HStack() {
      Text(member.name).accessibilityLabel(member.name)
        .fontWeight(.bold)
    }
//    .onAppear {
//      model.getUser(id: post.userId)
//    }
  }
}

