
import Foundation
import SwiftUI

class ViewModel: ObservableObject {
//    @Published var loginCred: LoginCredentials? = LoginCredentials(email: "aksunil@ucsc.edu", password: "1921683")
   @Published var loginCred: LoginCredentials?
    @Published var member: Member?
    @Published var workspaces = [Workspace]()
    @Published var otherMembers = [OtherMember]()
    @Published var otherWorkspaceMembers = [OtherMember]()
    //@Published var workspaceID: String?
    @Published var channels = [Channel]()
    @Published var messages = [Message]()
    @Published var channel: Channel?
    @Published var workspace: Workspace?
    
    
    
    func logout() {
        member = nil
    }
    
    
    func getMember() {
        
        guard let email = loginCred?.email, let password = loginCred?.password else {
            return
        }
        
        Task {
            do {
                let memberr = try await LoginRepo.login(email: email, password: password)
                DispatchQueue.main.async {
                   // print(memberr)
                    self.member = memberr
                }
            } catch {
                print("Login failed: \(error)")
            }
        }
    }
    
    func setChannel(chan: Channel) {
        DispatchQueue.main.async {
           // print(memberr)
            self.channel = chan
        }
    }
    
    func setWorkspace(ws: Workspace) {
        DispatchQueue.main.async {
           // print(memberr)
            self.workspace = ws
        }
    }
    
    func getWorkspaces() {
        print("Called Get Workspaces")
        let auth = member?.accessToken
        
        Task {
                let Workspaces = try await WorkspaceRepo.load(auth: auth!)
                DispatchQueue.main.async {
                   // print(memberr)
                    self.workspaces = Workspaces
                }
        }
        print("Finished Get Workspaces")
      }
    
    func getChannels(workspace: Workspace?) {
        self.setWorkspace(ws: workspace!)
        print("Called Get Channels")
        let auth = member?.accessToken
        
        Task {
            let Channels = try await ChannelRepo.load(auth: auth!, id: (workspace?.id.uuidString)!)
                DispatchQueue.main.async {
                   // print(memberr)
                    self.channels = Channels
                }
        }
        print("Finished Get Channels")
      }
    
    func getMessages(channel: Channel?) {
        self.setChannel(chan: channel!)
        let auth = member?.accessToken
        
        Task {
                let Messages = try await MessageRepo.load(auth: auth!, id: (channel?.id.uuidString)!)
                DispatchQueue.main.async {
                   // print(memberr)
                    self.messages = Messages
                }
        }
      }
    
    
    func getOtherMembers() {
        let auth = member?.accessToken
        Task {
                let Members = try await MemberRepo.load(auth: auth!)
                DispatchQueue.main.async {
                   // print(memberr)
                    self.otherMembers = Members
                }
        }
      }
    
    func getOtherWorkspaceMembers() {
        let auth = member?.accessToken
        Task {
                let Members = try await MemberRepo.get(auth: auth!, id: (workspace?.id.uuidString)!)
                DispatchQueue.main.async {
                   // print(memberr)
                    self.otherWorkspaceMembers = Members
                }
        }
      }
    
//    func getClickedMember(id: UUID) async throws -> String {
//        let auth = member!.accessToken
//            let loaded = try! await MemberRepo.load(auth: auth)
//            let matchingMembers = loaded.filter { $0.id == id }
//            let member = matchingMembers.first
//                // Found the member with the matching ID
//                // Do something with the member...
//            return member!.name
//        }
//
    
    func addMessage(content: String) {
        let auth = member?.accessToken
        Task {
            let loaded = try! await MessageRepo.add(auth: auth!, id: (channel?.id.uuidString)!, content: content)
            let Messages = try await MessageRepo.load(auth: auth!, id: (self.channel?.id.uuidString)!)
            DispatchQueue.main.async {
               // print(memberr)
                self.messages = Messages
            }
        }
      }
    
    
    func addWorkspace(name: String) {
        let auth = member?.accessToken
        Task {
            let loaded = try! await WorkspaceRepo.add(auth: auth!, name: name)
            print("3")
            let Workspaces = try await WorkspaceRepo.load(auth: auth!)
            DispatchQueue.main.async {
               // print(memberr)
                self.workspaces = Workspaces
            }
        }
      }
    
    func addChannel(name: String) {
        let auth = member?.accessToken
        Task {
            print("Stared add Channel")
            let loaded = try! await ChannelRepo.add(auth: auth!, id: (self.workspace?.id.uuidString)!, name: name)
          //  sleep(1)
            let Channels = try await ChannelRepo.load(auth: auth!, id: (self.workspace?.id.uuidString)!)
            DispatchQueue.main.async {
               // print(memberr)
                self.channels = Channels
            }
            print("Ended add Channel")
        }
      }
    
    func addMember(mid: String) {
        let auth = member?.accessToken
        Task {
            print("Adding")
            let loaded = try! await MemberRepo.add(auth: auth!, wid: (workspace?.id.uuidString)!, mid: mid)
            let Members = try await MemberRepo.get(auth: auth!, id: (workspace?.id.uuidString)!)
            DispatchQueue.main.async {
               // print(memberr)
                self.otherWorkspaceMembers = Members
            }
        }
      }
    
    
    func deleteMessage(id: String) {
        let auth = member?.accessToken
        Task {
            print("Deleting Message")
            try! await MessageRepo.delete(auth: auth!, id: id)
            let Messages = try await MessageRepo.load(auth: auth!, id: (self.channel?.id.uuidString)!)
            DispatchQueue.main.async {
               // print(memberr)
                self.messages = Messages
            }
        }
        
    }
    
    func deleteMemberWorkspace(mid: String) {
        let auth = member?.accessToken
        Task {
            print("Deleting Workspace Member")
            try! await MemberRepo.delete(auth: auth!, wid: (workspace?.id.uuidString)!, mid: mid)
            let Members = try await MemberRepo.get(auth: auth!, id: (workspace?.id.uuidString)!)
            DispatchQueue.main.async {
               // print(memberr)
                self.otherWorkspaceMembers = Members
            }
        }
        
    }
    
    func deleteWorkspace(id: String) {
        let auth = member?.accessToken
        Task {
            print("Deleting Workspace")
            try! await WorkspaceRepo.delete(auth: auth!, id: id)
            print("4")
            let Workspaces = try await WorkspaceRepo.load(auth: auth!)
            DispatchQueue.main.async {
               // print(memberr)
                self.workspaces = Workspaces
            }
        }
    }
    
    func deleteChannel(id: String) {
        let auth = member?.accessToken
        Task {
            print("Deleting Channel")
            try! await ChannelRepo.delete(auth: auth!, id: id)
            let Channels = try await ChannelRepo.load(auth: auth!, id: (self.workspace?.id.uuidString)!)
            DispatchQueue.main.async {
               // print(memberr)
                self.channels = Channels
            }
            print("Finished Delete")
        }
    }
    
    func reset() {
        let auth = member?.accessToken
        Task.detached {
            print("Reset")
            try! await WorkspaceRepo.reset(auth: auth!)
            sleep(1)
            print("5")
            let Workspaces = try await WorkspaceRepo.load(auth: auth!)
            DispatchQueue.main.async {
               // print(memberr)
                self.workspaces = Workspaces
            }
            print("Reset Finished")
        }
        
    }








    
  
//  func getPosts() {
//    Task {
//      let loaded = try! await PostRepo.load()
//      DispatchQueue.main.async {
//        self.posts = loaded
//      }
//    }
//  }
}
