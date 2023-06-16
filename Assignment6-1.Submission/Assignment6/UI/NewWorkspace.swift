//
//  ComposeMessage.swift
//  Assignment6
//
//  Created by Abhinav Sunil on 5/17/23.
//

import SwiftUI

struct NewWorkspace: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @EnvironmentObject var model: ViewModel
    var body: some View {
        VStack {
            VStack {
                           ZStack(alignment: .topLeading) {
                               RoundedRectangle(cornerRadius: 10)
                                   .stroke(Color.gray, lineWidth: 1)
                               
                               TextEditor(text: $name)
                                   .frame(height: 200)
                                   .overlay(name.isEmpty ? Text("Name").foregroundColor(.gray) : nil)
                                   .accessibilityIdentifier("Name") 
                           }
                       }
                       .frame(width: 320, height: 250)
                   .padding(.top, -300) // Add .padding(.top) to move the VStack closer to the top
        
            
            HStack {
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                Button("OK") {
                            model.addWorkspace(name: name)
                            presentationMode.wrappedValue.dismiss()
                }.disabled(name.count < 4 || name.count > 32)
                
            }
        }
        .navigationBarTitle("New Workspace")
    }
}
