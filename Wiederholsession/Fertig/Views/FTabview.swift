//
//  FTabview.swift
//  Wiederholsession
//
//  Created by Felix Bücher on 13.04.23.
//

import SwiftUI

struct FTabview: View {
    
    @ObservedObject var viewModel : FViewModel
    
    var body: some View {
        NavigationStack {
            TabView {
                FArticleList(viewModel: viewModel).tabItem {
                    Label("Article", systemImage: "house")
                }
                FShoppingList(viewModel: viewModel).tabItem {
                    Label("Shopping", systemImage: "list.dash")
                }
            }
        }
    }
}

struct FTabview_Previews: PreviewProvider {
    static var previews: some View {
        FTabview(viewModel: FViewModel())
    }
}
