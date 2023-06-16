

import SwiftUI

//Chat GPT helped me turn navlinks into button including the creation of a tracker variable so Views dont communicate with each other
//Chat GPT helped me with swipe actions
struct WorkspaceList: View {
  @EnvironmentObject var model: ViewModel
  //  @State private var selectedWorkspace: Workspace?

  var body: some View {
    VStack() {
          List {
              ForEach(model.workspaces) { workspace in
                  NavigationLink(destination: ChannelList(workspace: workspace)) {
                      WorkspaceCard(workspace: workspace)
                  }
                 .accessibilityLabel(workspace.name)
                 .swipeActions {
                     if workspace.owner == model.member?.id {
                         Button(action: {
                             model.deleteWorkspace(id: workspace.id.uuidString)
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
//          model.getWorkspaces()
//        }
    }
    .onAppear {
       print("1")
       model.getWorkspaces()
    }
      
    .navigationBarTitle("Workspaces")
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarItems(leading:
        Button(action: {
            model.logout()
        }) {
            Image(systemName: "rectangle.portrait.and.arrow.right")
        }
        .accessibilityLabel("Logout")
        .padding(.vertical)
    )
    .navigationBarItems(trailing:
        HStack {

            Button(action: {
                         model.reset()
                    //   model.getWorkspaces()
            }) {
                Image(systemName: "arrow.counterclockwise.circle")
            }.accessibilityLabel("Reset")


            NavigationLink(destination: NewWorkspace()) {
                Image(systemName: "plus")
            }.accessibilityLabel("New Workspace")

        }
    )
  }
}
