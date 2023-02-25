//
//  AppointmentViewModel.swift.swift
//  SouthTeams
//
//  Created by Francisco Obarrio on 24/02/2023.
//

import Foundation
import SwiftUI
import Combine

enum LoadingState: Equatable {
    case idle
    case loading
    case failed
    case success
}

final class AppointmentViewModel: ObservableObject {
    
    @Published var appointments: [Appointment] = []
    @Published var selectedAppointment: Appointment?
    @Published var state: LoadingState = .idle
    
    @State var showErrorAlert = false
    
    private var networkService: NetworkServiceable
    private var postsPublisher: AnyCancellable?
    
    
    init(networkService: NetworkServiceable) {
        self.networkService = networkService
    }
    
    func getAppointments()  {
        
        guard state != .loading else {
            return
        }
        state = .loading
        
        postsPublisher = networkService.getAppointments()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("error \(error)")
                    self.showErrorAlert = true
                    self.state = .failed
                }
            }, receiveValue: { [weak self] appointments in
                let mappedAppointments = appointments.map { Appointment(id: $0.id, durationInMinutes: $0.durationInMinutes, overrideName: $0.overrideName, bookingDeposit: $0.bookingDeposit, appointmentTypeId: $0.appointmentTypeId, appointmentPurposeId: $0.appointmentPurposeId) }
                                
                DispatchQueue.main.async {
                    self?.appointments = mappedAppointments
                    self?.state = .success
                }
            })
    }
    
    func selectAppointment(at index: Int) {
        self.selectedAppointment = self.appointments[index]
    }
}
