//
//  FAddView.swift
//  Wiederholsession
//
//  Created by Felix Bücher on 13.04.23.
//

import SwiftUI

struct FAddView: View {
    
    @ObservedObject var viewModel: FViewModel
    @Environment(\.dismiss) var dismiss
    @State var name = ""
    @State var alerted = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer().frame(width: 20)
                Text("Article name: ")
                Spacer()
                TextField("Name of the article:", text: $name)
                    .foregroundColor(Color.black)
                Spacer().frame(width: 20)
            }
            Spacer().frame(height: 60)
            Button("Add article") {
                if !name.isEmpty {
                    viewModel.addArticle(name)
                    dismiss()
                } else {
                    alerted = true

                }
            }.foregroundColor(Color.black)
                .frame(width: 250, height: 50)
                .background(Color.green)
                .cornerRadius(20)
                .font(.system(size: 30))
                .alert("Name is empty", isPresented: $alerted) {
                    Button("OK", role: .cancel) {}
                }
        }
            
    }
}

struct FAddView_Previews: PreviewProvider {
    static var previews: some View {
        FAddView(viewModel: FViewModel())
    }
}
