//
//  FShoppingEntry.swift
//  Wiederholsession
//
//  Created by Felix Bücher on 13.04.23.
//

import SwiftUI

struct FShoppingEntry: View {
    
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
                viewModel.removeFromShoppingList(entry)
            } label: {
                Image(systemName: "trash")
            }.buttonStyle(PlainButtonStyle()).foregroundColor(Color.red)
            Spacer().frame(width: 30)
        }
    }
}

struct FShoppingEntry_Previews: PreviewProvider {
    static var previews: some View {
        let context = FViewModel().container.viewContext
        let entry = Artikel.init(context: context)
        entry.name = "Test"
        entry.id = UUID()
        entry.inShoppingList = false
        entry.note = "Empty"
        return FShoppingEntry(entry: entry, viewModel:  FViewModel()).environment(\.managedObjectContext, context)
    }
}
