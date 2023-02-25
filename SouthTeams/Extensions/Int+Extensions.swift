//
//  Int+Extensions.swift
//  SouthTeams
//
//  Created by Francisco Obarrio on 24/02/2023.
//

import Foundation

extension Int {
    var toAudioString: String {
        let h = self / 3600
        let m = (self % 3600) / 60
        let s = (self % 3600) % 60
        return h > 0 ? String(format: "%1d:%02d:%02d", h, m, s) : String(format: "%1d:%02d", m, s)
    }
}
