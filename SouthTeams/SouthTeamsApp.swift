//
//  SouthTeamsApp.swift
//  SouthTeams
//
//  Created by Francisco Obarrio on 23/02/2023.
//

import SwiftUI

@main
struct SouthTeamsApp: App {
    var body: some Scene {
        WindowGroup {
            let networkService = NetworkService(baseURLString: "https://appointmentrequestsapi-dev.symplast.com/")
            let viewModel = AppointmentViewModel(networkService: networkService)
            MainView(viewModel: viewModel)            
        }
    }
}
