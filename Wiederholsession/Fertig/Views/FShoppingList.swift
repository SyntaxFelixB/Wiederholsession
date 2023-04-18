//
//  FShoppingList.swift
//  Wiederholsession
//
//  Created by Felix Bücher on 13.04.23.
//

import SwiftUI

struct FShoppingList: View {
    
    @ObservedObject var viewModel = FViewModel()
    
    var body: some View {
        VStack {
            Spacer().frame(height: 30)
            Button("Clear Shoppinglist") {
                viewModel.clearShoppingList()
            }.foregroundColor(Color.black)
                .font(.system(size: 25))
                .frame(width: 250, height: 50)
                .background(Color.red)
                .cornerRadius(15)
            List {
                ForEach(viewModel.shoppingList) { article in
                    FShoppingEntry(entry: article, viewModel: viewModel)
                }
            }
        }
    }
}

struct FShoppingList_Previews: PreviewProvider {
    static var previews: some View {
        FShoppingList()
    }
}
