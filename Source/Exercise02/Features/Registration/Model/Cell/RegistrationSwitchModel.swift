//
//  RegistrationSwitchModel.swift
//  Exercise02
//
//  Created by Calebe Emerick on 19/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class RegistrationSwitchModel {
	
	let label: String
	let switchState: Bool
	
	init(label: String) {
		self.label = label
		switchState = false
	}
}

extension RegistrationSwitchModel : RegistrationCellProtocol {
	
	var type: RegistrationCellType {
		return .switch
	}
	
	var height: CGFloat {
		return 60
	}
}
