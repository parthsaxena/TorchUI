//
//  Date+Extension.swift
//  TorchUI
//
//  Created by Saeed on 03/12/2023.
//

import Foundation

extension Date {
    func timeIn24HourFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
}
