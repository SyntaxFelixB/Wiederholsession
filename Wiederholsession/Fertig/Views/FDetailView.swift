//
//  FDetailView.swift
//  Wiederholsession
//
//  Created by Felix Bücher on 13.04.23.
//

import SwiftUI

struct FDetailView: View {
    
    @State var article: Artikel
    @State var note: String
    @State var oldNote: String
    @State var alerted = false
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: FViewModel
    
    init(newArticle : Artikel, newViewModel: FViewModel) {
        viewModel = newViewModel
        _article = State(initialValue: newArticle)
        _oldNote = State(initialValue: newArticle.note!)
        _note = State(initialValue: newArticle.note!)
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer().frame(width: 20)
                Text("Article note: ")
                Spacer()
                TextField(note, text: $note)
                    .foregroundColor(Color.black)
                Spacer().frame(width: 20)
            }
            Spacer().frame(height: 60)
            Button("Save note") {
                viewModel.saveNote(note, article)
                dismiss()
            }.foregroundColor(Color.black)
                .frame(width: 250, height: 50)
                .background(Color.green)
                .cornerRadius(20)
                .font(.system(size: 30))
        }
    }
}

struct FDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let context = FViewModel().container.viewContext
        let entry = Artikel.init(context: context)
        entry.name = "Test"
        entry.id = UUID()
        entry.inShoppingList = false
        entry.note = "Empty"
        return FDetailView(newArticle: entry, newViewModel: FViewModel()).environment(\.managedObjectContext, context)
    }
}
