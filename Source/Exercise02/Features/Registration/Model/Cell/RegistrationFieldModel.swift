//
//  RegistrationFieldModel.swift
//  Exercise02
//
//  Created by Calebe Emerick on 19/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class RegistrationFieldModel {
	
	let fieldType: RegistrationFieldType
	let placeholder: String
	let lineColor: CGColor
	let textCapitalization: UITextAutocapitalizationType
	let keyboardType: UIKeyboardType
	let keyboardButton: UIReturnKeyType
	let keyboardCustomView: KeyboardAccessoryView?
	
	init(type: RegistrationFieldType) {
		fieldType = type
		placeholder = type.placeholder
		lineColor = type.lineColor
		textCapitalization = type.capitalization
		keyboardType = type.keyboardType
		keyboardButton = type.keyboardButton
		keyboardCustomView = type.keyboardCustomView
	}
}

extension RegistrationFieldModel: RegistrationCellProtocol {
	
	var type: RegistrationCellType {
		return .field
	}
	
	var height: CGFloat {
		return 60
	}
}
