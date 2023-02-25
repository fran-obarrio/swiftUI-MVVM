//
//  AppointmentModel.swift
//  SouthTeams
//
//  Created by Francisco Obarrio on 24/02/2023.
//

import Foundation

struct AppointMentResponseDataModel: Decodable {
    let appointmentArray: [Appointment]
    
    enum CodingKeys: String, CodingKey {
        case result
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.appointmentArray = try container.decode([Appointment].self, forKey: .result)
    }
}

struct Appointment: Identifiable, Codable {
    let id: Int
    var durationInMinutes: Int
    var overrideName: String
    var bookingDeposit: Double
    var appointmentTypeId: Int
    var appointmentPurposeId: Int
    
    
    public init(id: Int, durationInMinutes: Int, overrideName: String, bookingDeposit: Double, appointmentTypeId: Int, appointmentPurposeId: Int) {
        self.id = id
        self.durationInMinutes = durationInMinutes
        self.overrideName = overrideName
        self.bookingDeposit = bookingDeposit
        self.appointmentTypeId = appointmentTypeId
        self.appointmentPurposeId = appointmentPurposeId
    }
    
}
