//
//  WiederholsessionApp.swift
//  Wiederholsession
//
//  Created by Felix Bücher on 12.04.23.
//

import SwiftUI

@main
struct WiederholsessionApp: App {
    @StateObject var viewModel = FViewModel()
    var body: some Scene {
        WindowGroup {
            FTabview(viewModel: viewModel)
        }
    }
}
