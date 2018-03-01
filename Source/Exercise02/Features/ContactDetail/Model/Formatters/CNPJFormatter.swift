//
//  CNPJFormatter.swift
//  Exercise02
//
//  Created by Calebe Emerick on 26/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class CNPJFormatter: BaseFormatter {
	
	init() {
		super.init(pattern: "(\\d{2})(\\d{3})(\\d{3})(\\d{4})(\\d{2})",
					  result: "$1.$2.$3/$4-$5")
	}
	
	override init(pattern: String, result: String) {
		super.init(pattern: pattern, result: result)
	}
	
	func format(_ cnpj: String) -> String {
		
		guard !cnpj.isEmpty else {
			return ""
		}
		
		let cnpjNumber = getOnlyStringNumbers(from: cnpj)
		
		guard cnpjNumber.count == 14 else {
			return ""
		}
		
		let formattedCnpj = getFormatted(cnpjNumber)
		
		return formattedCnpj
	}
}
