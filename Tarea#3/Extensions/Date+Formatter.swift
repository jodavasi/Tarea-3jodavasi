//
//  Date+Formatter.swift
//  Tarea#3
//
//  Created by MAC on 3/26/20.
//  Copyright © 2020 jodavasi`. All rights reserved.
//

import UIKit

extension Date {

    func getFormatterd(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String{
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        let localizedDate = formatter.string(from: self)
        return localizedDate
    }
}
