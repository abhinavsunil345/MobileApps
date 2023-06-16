
import SwiftUI

struct Assignment6View: View {
    @EnvironmentObject var model: ViewModel
  var body: some View {
      if model.member != nil {
          NavigationView {
              WorkspaceList()
          }
          } else {
            LoginView()
          }
        }
  }

#if !TESTING
struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    Assignment6View()
  }
}
#endif
