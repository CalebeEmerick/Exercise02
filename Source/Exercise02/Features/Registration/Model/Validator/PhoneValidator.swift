//
//  PhoneValidator.swift
//  Exercise02
//
//  Created by Calebe Emerick on 20/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class PhoneValidator: RegexBaseValidator {
	
	let pattern: String
	
	init(pattern: String) {
		self.pattern = pattern
	}
	
	override init() {
		pattern = "^(([0-9]{2,3})|(\\([0-9]{2,3}\\)))[[:space:]]?([0-9]{9})$"
	}
	
	func validate(phone: String) -> Bool {
		
		guard !phone.isEmpty else {
			return false
		}
		
		return validate(phone, with: pattern)
	}
}
