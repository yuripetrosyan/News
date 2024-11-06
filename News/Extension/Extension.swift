//
//  Extension.swift
//  News
//
//  Created by Yuri Petrosyan on 06/11/2024.
//

import Foundation


extension Date {
//    func formatted(_ format: String = "MMMM d") -> String {
//           let formatter = DateFormatter()
//           formatter.dateFormat = "MMMM d"
//           return formatter.string(from: self)
//       }
    
    func currentMonthAndDay() -> String {
          let date = Date()
          let formatter = DateFormatter()
          formatter.dateFormat = "MMMM d" // "MMMM" for full month name and "d" for the day
          return formatter.string(from: date)
      }
}




