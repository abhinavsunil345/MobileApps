import SwiftUI

struct MessagesList: View {
  @EnvironmentObject var model: ViewModel
    var channel: Channel
    var body: some View {
         VStack {
             if model.messages.isEmpty {
                 ProgressView()
             } else {
                 List {
                     ForEach(model.messages) { message in
                         MessagesCard(message: message).swipeActions {
                             Button(action: {
                                 model.deleteMessage(id: message.id.uuidString)
                                // model.getMessages()
                             }, label: {
                                 Label("Delete", systemImage: "trash")
                             })
                             .tint(.red)
                         }.disabled(message.member != model.member?.id && model.member?.id != model.workspace?.owner)
                     }
                 }
//                 .refreshable {
//                     model.getMessages()
//                 }
             }
         }
    .onAppear {
        print("Appeared")
        model.getMessages(channel: channel)
    }
    .navigationBarTitle(channel.name)
            .navigationBarItems(trailing:
                    NavigationLink(destination: ComposeMessage()) {
                    Image(systemName: "plus")
                }.accessibilityLabel("New Message")
            )
  }
}
