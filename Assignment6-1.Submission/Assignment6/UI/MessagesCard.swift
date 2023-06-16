import SwiftUI

struct MessagesCard: View {
    var message: Message
    @EnvironmentObject var model: ViewModel
    
    
    func getClickedMember(id: UUID) -> String {
        //model.getOtherMembers()
        let matchingMembers = model.otherMembers.filter { $0.id == id }
        if let member = matchingMembers.first {
            // Found the member with the matching ID
            // Do something with the member...
            return member.name
        } else {
            // Member not found
            return "Member not found"
        }
    }
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy 'at' h:mm a"
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        let name = getClickedMember(id: message.member)
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(name).bold()
                Text(message.content)
                let dateString = formatDate(date: message.posted)
                Text(dateString).font(.caption)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                   .offset(x: -5, y: -5).padding(14)
            }
            
        }
        .onAppear {
            model.getOtherMembers()
        }
        
    }
}



