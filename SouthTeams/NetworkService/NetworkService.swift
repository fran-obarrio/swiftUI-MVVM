//
//  NetworkService.swift
//  SouthTeams
//
//  Created by Francisco Obarrio on 24/02/2023.
//

import Foundation
import Combine

protocol NetworkServiceable {
    func getAppointments() -> AnyPublisher<[Appointment], Never>
}

class NetworkService: NetworkServiceable {

    let urlSession: URLSession
    let baseURLString: String

    init(urlSession: URLSession = .shared, baseURLString: String) {
        self.urlSession = urlSession
        self.baseURLString = baseURLString
    }

    func getAppointments() -> AnyPublisher<[Appointment], Never> {

        let urlString = baseURLString + "AppointmentTypesPurposes?tenantId=1007"

        guard let url = URL(string: urlString) else {
            return Just<[Appointment]>([]).eraseToAnyPublisher()
        }

        return urlSession.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: AppointMentResponseDataModel.self, decoder: JSONDecoder())
            .map { $0.appointmentArray }
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}

