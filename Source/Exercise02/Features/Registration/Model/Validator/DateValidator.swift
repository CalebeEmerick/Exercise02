//
//  DateValidator.swift
//  Exercise02
//
//  Created by Calebe Emerick on 21/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class DateValidator: RegexBaseValidator {
	
	private let formatter: DateFormatter
	private let pattern: String
	
	init(pattern: String, formatter: DateFormatter) {
		self.pattern = pattern
		self.formatter = formatter
	}
	
	override init() {
		pattern = "^[0-9]{2}/[0-9]{2}/[0-9]{4}$"
		formatter = DateFormatter()
		formatter.dateStyle = .short
		formatter.locale = Locale(identifier: "pt_BR")
	}
	
	func validate(date: String) -> Bool {
		
		let conditions: [Bool] = [
			!date.isEmpty,
			isDateInAValidFormat(date),
			isDateReal(date)
		]
		
		guard !conditions.contains(false) else {
			return false
		}
		
		return true
	}
	
	private func isDateInAValidFormat(_ date: String) -> Bool {
		return validate(date, with: pattern)
	}
	
	private func isDateReal(_ date: String) -> Bool {
		return formatter.date(from: date) != nil
	}
}
