//
//  ViewController.swift
//  FSCAl
//
//  Created by Admin on 27/06/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import FSCalendar

class ViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource {
    @IBOutlet weak var fsCalender: FSCalendar!
    var selectedDate = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
        fileprivate let gregorian: NSCalendar! = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
    func  maximumDate(for calendar: FSCalendar) -> Date {
        return formatter.date(from: "30/12/2050")!
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selectedDate.append(formatter.string(from: date))
        print("am selected the date is  \(formatter.string(from: date))")
        print(selectedDate)
        for dates in selectedDate {
            print(dates)
        }
        for da in 0..<10{
            print(da)
        }
    }
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        return gregorian.isDateInToday(date) ? "今天" : nil
    }
    


}

