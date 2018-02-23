//
//  EmailValidator.swift
//  Exercise02
//
//  Created by Calebe Emerick on 20/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class EmailValidator: RegexBaseValidator {
	
	private let pattern: String
	
	init(pattern: String) {
		self.pattern = pattern
	}
	
	override init() {
		pattern = "[A-Z0-9a-z._%!#$+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
	}
	
	func validate(email: String) -> Bool {
		
		guard !email.isEmpty else {
			return false
		}
		
		return validate(email, with: pattern)
	}
}
