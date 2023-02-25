//
//  MainView.swift
//  SouthTeams
//
//  Created by Francisco Obarrio on 23/02/2023.
//

import SwiftUI
import Lottie

struct MainView: View {
    
    @ObservedObject var viewModel: AppointmentViewModel
    
    @State private var searchText = ""
    @State private var showView = false
    @State var isPlaying: Bool = true
    
    let screen = UIScreen.main.bounds
    
    var filteredAppointments: [Appointment] {
        if searchText.isEmpty {
            return viewModel.appointments
        } else {
            return viewModel.appointments.filter { $0.overrideName.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        let state = viewModel.state
        switch state {
        case .idle:
            Color.clear.onAppear(perform: viewModel.getAppointments)
        case .loading:
            LottieView(animationName: "jsonLoader", play: $isPlaying)
                .frame(width: screen.width / 2, height: screen.height / 2)
        case .success:
            NavigationStack {
                List {
                    ForEach(Array(filteredAppointments.enumerated()), id: \.offset) { index, appointment in
                        VStack{
                            CellView(appointment: appointment)
                        }.onTapGesture {
                            viewModel.selectAppointment(at: index)
                            showView = true
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                        .listRowSeparator(.hidden)
                        .sheet(isPresented: $showView) {
                            AppointmentDetail(message: $viewModel.selectedAppointment, isPresented: $showView)
                        }
                        
                    }
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Appointment Types")                
            }
            .searchable(text: $searchText)
        case .failed:
            Color.clear.alert(isPresented: $viewModel.showErrorAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("There was an error"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    
}
