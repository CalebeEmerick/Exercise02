//
//  PhoneFormatter.swift
//  Exercise02
//
//  Created by Calebe Emerick on 26/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class PhoneFormatter: BaseFormatter {
	
	init() {
		super.init(pattern: "(\\d{2,3})(\\d{5})(\\d{4})", result: "($1) $2 $3")
	}
	
	override init(pattern: String, result: String) {
		super.init(pattern: pattern, result: result)
	}
	
	func format(_ phone: String) -> String {

		guard !phone.isEmpty else {
			return ""
		}
		
		let phoneNumber = getOnlyStringNumbers(from: phone)
		
		guard phoneNumber.count == 11 || phoneNumber.count == 12 else {
			return ""
		}
		
		let formattedNumber = getFormatted(phoneNumber)

		return formattedNumber
	}
}
