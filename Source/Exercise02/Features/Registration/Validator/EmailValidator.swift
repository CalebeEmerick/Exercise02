//
//  EmailValidator.swift
//  Exercise02
//
//  Created by Calebe Emerick on 20/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class EmailValidator {
	
	private let pattern: String
	
	init(pattern: String) {
		self.pattern = pattern
	}
	
	init() {
		pattern = "[A-Z0-9a-z._%!#$+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
	}
	
	func validate(email: String) -> Bool {
		
		guard !email.isEmpty else {
			return false
		}
		
		return isEmailValid(email: email)
	}
	
	private func isEmailValid(email: String) -> Bool {
		let regex = try? NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
		let range = NSRange(location: 0, length: email.count)
		let numberOfMatches = regex?.numberOfMatches(in: email, options: [], range: range) ?? 0
		return numberOfMatches > 0
	}
}
