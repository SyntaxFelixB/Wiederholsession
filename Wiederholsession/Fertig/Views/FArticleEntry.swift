//
//  FArticleEntry.swift
//  Wiederholsession
//
//  Created by Felix Bücher on 13.04.23.
//

import SwiftUI

struct FArticleEntry: View {
    
    @State var entry : Artikel
    @ObservedObject var viewModel: FViewModel
    
    var body: some View {
        HStack {
            Spacer().frame(width: 30)
            NavigationLink(entry.name!) {
                FDetailView(newArticle: entry, newViewModel: viewModel)
            }.foregroundColor(Color.black)
            Spacer()
            Button {
                viewModel.addToShoppingList(entry)
            } label: {
                Image(systemName: "cart")
            }.buttonStyle(PlainButtonStyle())
            .foregroundColor(Color.green)
                
            Spacer().frame(width: 30)
        }
    }
}

struct FArticleEntry_Previews: PreviewProvider {
    static var previews: some View {
        let context = FViewModel().container.viewContext
        let entry = Artikel.init(context: context)
        entry.name = "Test"
        entry.id = UUID()
        entry.inShoppingList = false
        entry.note = "Empty"
        return FArticleEntry(entry: entry, viewModel:  FViewModel()).environment(\.managedObjectContext, context)
    }
}
