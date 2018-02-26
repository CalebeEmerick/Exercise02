//
//  PhoneFormatter.swift
//  Exercise02
//
//  Created by Calebe Emerick on 26/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class PhoneFormatter {
	
	private let pattern: String
	private let result: String
	
	init() {
		pattern = "(\\d{2})(\\d{5})(\\d{4})"
		result = "($1) $2 $3"
	}
	
	init(pattern: String, result: String) {
		self.pattern = pattern
		self.result = result
	}
	
	func format(_ phone: String) -> String {
		
		guard !phone.isEmpty else {
			return ""
		}
		
		let phoneNumbers = getOnlyStringNumbers(from: phone)
		
		let formattedNumber = formatPhoneNumber(phoneNumbers)
		
		return formattedNumber
	}
	
	private func getOnlyStringNumbers(from text: String) -> String {
		let phone = text.flatMap {
			Int(String($0))
			}.map {
				String($0)
			}.joined()
		
		return phone
	}
	
	private func formatPhoneNumber(_ phone: String) -> String {
		return phone.replacingOccurrences(
			of: pattern,
			with: result,
			options: .regularExpression,
			range: nil
		)
	}
}
