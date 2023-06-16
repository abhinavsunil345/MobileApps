import SwiftUI

struct WorkspaceCard: View {
  let workspace: Workspace
  var body: some View {
    HStack() {
      Text(workspace.name).accessibilityLabel(workspace.name)
        .fontWeight(.bold)
      Spacer()
      Text(String(workspace.channels)).accessibilityLabel(String(workspace.channels))
    }
//    .onAppear {
//      model.getUser(id: post.userId)
//    }
  }
}
