//
//  MEIFormatter.swift
//  Exercise02
//
//  Created by Calebe Emerick on 27/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class MEIFormatter {
	
	func format(_ condition: Bool) -> String {
		
		if condition {
			return "Sim"
		}
		
		return "Não"
	}
}
