//
//  BaseFormatter.swift
//  Exercise02
//
//  Created by Calebe Emerick on 26/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

class BaseFormatter {
	
	let pattern: String
	let result: String
	
	init(pattern: String, result: String) {
		self.pattern = pattern
		self.result = result
	}
	
	func getOnlyStringNumbers(from text: String) -> String {
		return text.flatMap {
			Int(String($0))
			}.map {
				String($0)
			}.joined()
	}
	
	func getFormatted(_ text: String) -> String {
		return text.replacingOccurrences(
			of: pattern,
			with: result,
			options: .regularExpression,
			range: nil
		)
	}
}
