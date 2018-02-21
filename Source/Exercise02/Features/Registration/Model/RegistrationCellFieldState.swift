//
//  RegistrationCellFieldState.swift
//  Exercise02
//
//  Created by Calebe Emerick on 22/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

enum RegistrationCellFieldState {
	
	case valid
	case invalid
	
	init(isValid: Bool) {
		if isValid {
			self = .valid
		}
		else {
			self = .invalid
		}
	}
	
	var color: CGColor {
		switch self {
		case .valid:
			return Color(hexString: "#6cb94a").cgColor
		case .invalid:
			return Color(hexString: "#ee6a64").cgColor
		}
	}
}
