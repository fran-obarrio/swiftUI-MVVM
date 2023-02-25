//
//  AppointmentDetail.swift
//  SouthTeams
//
//  Created by Francisco Obarrio on 24/02/2023.
//

import SwiftUI

struct AppointmentDetail: View {

    @Binding var message: Appointment?
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Title \(message?.overrideName ?? "")")
                .font(.headline)
                .foregroundColor(.white)
                .shadow(color: Color(red: 0.1569, green: 0.1412, blue: 0, opacity: 0.5), radius: 2, x: 0, y: 2)
            Spacer()
            Text("Duration \(String(message?.durationInMinutes.toAudioString ?? ""))")
                .font(.subheadline)
                .foregroundColor(.white)
                .shadow(color: Color(red: 0.1569, green: 0.1412, blue: 0, opacity: 0.5), radius: 2, x: 0, y: 2)
            Text("Deposit \(String(format: "$%.02f", message?.bookingDeposit ?? 0.0))") .font(.subheadline)
                .foregroundColor(.white)
                .shadow(color: Color(red: 0.1569, green: 0.1412, blue: 0, opacity: 0.5), radius: 2, x: 0, y: 2)

        }.frame(
            minWidth: 0,
            maxWidth: 300,
            minHeight: 0,
            maxHeight: 150,
            alignment: .topLeading
          ).padding()
              .background(Color(red:0.40, green:0.40, blue:0.48, opacity: 0.9))
              .cornerRadius(15)
              .shadow(color: .black, radius: 2, x: 0, y: 2)
              .padding(.bottom, 250)
        Text("Close Modal")
        .padding()
        .border(Color.primary)
        .onTapGesture {
            isPresented = false
        }
    }
}
