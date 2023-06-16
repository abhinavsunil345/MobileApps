import SwiftUI

struct ChannelCard: View {
  @EnvironmentObject var model: ViewModel
  let channel: Channel
  var body: some View {
    HStack() {
      Text(channel.name).accessibilityLabel(channel.name)
        .fontWeight(.bold)
        Spacer()
        Text(String(channel.messages)).accessibilityLabel(String(channel.messages))
    }
//    .onAppear {
//      model.getUser(id: post.userId)
//    }
  }
}
