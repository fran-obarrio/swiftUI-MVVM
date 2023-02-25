//
//  CellView.swift
//  SouthTeams
//
//  Created by Francisco Obarrio on 24/02/2023.
//

import Foundation
import SwiftUI

struct CellView: View {
    let appointment: Appointment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Title \(appointment.overrideName)")
                .font(.headline)
                .foregroundColor(.white)
                .shadow(color: Color(red: 0.1569, green: 0.1412, blue: 0, opacity: 0.5), radius: 2, x: 0, y: 2)
            Spacer()
            Text("Duration \(String(appointment.durationInMinutes.toAudioString))")
                .font(.subheadline)
                .foregroundColor(.white)
                .shadow(color: Color(red: 0.1569, green: 0.1412, blue: 0, opacity: 0.5), radius: 2, x: 0, y: 2)
            Text("Deposit \(String(format: "$%.02f", appointment.bookingDeposit))")
                .font(.subheadline)
                .foregroundColor(.white)
                .shadow(color: Color(red: 0.1569, green: 0.1412, blue: 0, opacity: 0.5), radius: 2, x: 0, y: 2)
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        ).padding()
            .background(Color(red:0.40, green:0.40, blue:0.48, opacity: 0.9))
            .cornerRadius(15)
            .shadow(color: .black, radius: 2, x: 0, y: 2)
    }
    
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
}
