//
//  CompanyNameValidator.swift
//  Exercise02
//
//  Created by Calebe Emerick on 21/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class CompanyNameValidator {
	
	func validate(name: String) -> Bool {
		
		guard !name.isEmpty else {
			return false
		}
		
		let conditions: [Bool] = [
			hasLessCharactersThanAllowed(for: name),
			hasMoreCharactersThanAllowed(for: name)
		]
		
		guard !conditions.contains(false) else {
			return false
		}
		
		return true
	}
	
	private func hasLessCharactersThanAllowed(for text: String) -> Bool {
		return text.count >= 2
	}
	
	private func hasMoreCharactersThanAllowed(for text: String) -> Bool {
		return text.count <= 20
	}
}
