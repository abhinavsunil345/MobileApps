import SwiftUI

struct ChannelList: View {
  @EnvironmentObject var model: ViewModel
  var workspace: Workspace
    
    //Chat GPT helped me turn navlinks into button including the creation of a tracker variable so Views dont communicate with each other
    //Chat GPT helped me with swipeactions
  var body: some View {
    VStack() {
//      if model.channels.isEmpty {
//        ProgressView()
//      }
//      else {
          List {
              ForEach(model.channels) { channel in
                  NavigationLink(destination: MessagesList(channel: channel)) {
                      ChannelCard(channel: channel)
                  }
                 .accessibilityLabel(channel.name)
                 .swipeActions {
                     if model.workspace?.owner == model.member?.id {
                         Button(action: {
                             model.deleteChannel(id: channel.id.uuidString)
                             //model.getChannels()
                         }) {
                             Label("Delete", systemImage: "trash")
                         }
                         .tint(.red)
                     }
                 }
              }
          }
//        .refreshable {
//            model.getChannels()
  //      }
//      }
    }
    .onAppear {
    //    model.channels = []
        model.getChannels(workspace: workspace)
    }
    .navigationBarTitle(workspace.name)
    .navigationBarItems(trailing:
        HStack {
            if model.workspace?.owner == model.member?.id {
                NavigationLink(destination: MemberView()) {
                    Image(systemName: "person.badge.plus")
                }.accessibilityLabel("Add Members")
                NavigationLink(destination: NewChannel()) {
                    Image(systemName: "plus")
                }.accessibilityLabel("New Channel")
            }
        }
    )
      
  }
}



