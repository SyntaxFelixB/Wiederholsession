//
//  FArticleList.swift
//  Wiederholsession
//
//  Created by Felix Bücher on 13.04.23.
//

import SwiftUI

struct FArticleList: View {
    
    @ObservedObject var viewModel: FViewModel
    
    var body: some View {
        VStack {
            Spacer().frame(height: 30)
            NavigationLink("Add article") {
                FAddView(viewModel: viewModel)
            }.foregroundColor(Color.black)
                .font(.system(size: 25))
                .frame(width: 250, height: 50)
                .background(Color.blue)
                .cornerRadius(15)
            List {
                ForEach(viewModel.articleList) { article in
                    FArticleEntry(entry: article, viewModel: viewModel)
                }
            }
        }
    }
}

struct FArticleList_Previews: PreviewProvider {
    static var previews: some View {
        FArticleList(viewModel: FViewModel())
    }
}
