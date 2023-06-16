//
//  ComposeMessage.swift
//  Assignment6
//
//  Created by Abhinav Sunil on 5/17/23.
//

import SwiftUI

struct ComposeMessage: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var content = ""
    @EnvironmentObject var model: ViewModel
    var body: some View {
        VStack {
            VStack {
                           ZStack(alignment: .topLeading) {
                               RoundedRectangle(cornerRadius: 10)
                                   .stroke(Color.gray, lineWidth: 1)
                               
                               TextEditor(text: $content)
                                   .frame(height: 200)
                                   .overlay(content.isEmpty ? Text("Enter Message").foregroundColor(.gray) : nil)
                                   .accessibilityIdentifier("Message") 
                           }
                       }
                       .frame(width: 320, height: 250)
                   .padding(.top, -300) // Add .padding(.top) to move the VStack closer to the top
        
            
            HStack {
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                Button("OK") {
                    model.addMessage(content: content)
                    //model.getMessages()
                                presentationMode.wrappedValue.dismiss()
                            }.disabled(content.count < 4)
                
            }
        }
        .navigationBarTitle("New Message")
    }
}
