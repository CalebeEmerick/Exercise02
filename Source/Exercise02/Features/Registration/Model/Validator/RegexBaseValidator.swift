//
//  RegexBaseValidator.swift
//  Exercise02
//
//  Created by Calebe Emerick on 20/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

class RegexBaseValidator {
	
	func validate(_ text: String, with pattern: String) -> Bool {
		let regex = try? NSRegularExpression(pattern: pattern, options: [])
		let range = NSRange(location: 0, length: text.count)
		let numberOfMatches = regex?.numberOfMatches(in: text, options: [], range: range) ?? 0
		return numberOfMatches > 0
	}
}
