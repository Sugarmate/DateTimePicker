//
//  ViewController.swift
//  DateTimePicker
//
//  Created by Huong Do on 9/16/16.
//  Copyright © 2016 ichigo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DateTimePickerDelegate {
    
    @IBAction func showDateTimePicker(sender: AnyObject) {
        let min = Date().addingTimeInterval(-60 * 60 * 24 * 365)
        let max = Date().addingTimeInterval(60 * 60 * 24 * 365)
        let picker = DateTimePicker.create(minimumDate: min, maximumDate: max)

        picker.selectedDate = Date()
        picker.dateFormat = "YYYY"
        let locale = NSLocale.current
        picker.locale = locale
        let formatter : String = DateFormatter.dateFormat(fromTemplate: "j", options:0, locale:locale)!
        if formatter.contains("a") {
            picker.is12HourFormat = true
        } else {
            picker.is12HourFormat = false
        }
        picker.highlightColor = UIColor.red
        picker.doneBackgroundColor = UIColor.blue

        picker.todayButtonTitle = NSLocalizedString("now", comment: "").localizedCapitalized
        picker.isDatePickerOnly = false
        picker.includeMonth = true
        picker.doneButtonTitle = NSLocalizedString("ok", comment: "").localizedUppercase
        
        picker.completionHandler = { (date : Date) in
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm aa dd/MM/YYYY"
            self.title = formatter.string(from: date)
        }
        
        picker.delegate = self
        
        picker.show()
    }
    
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
        title = picker.selectedDateString
    }
}
