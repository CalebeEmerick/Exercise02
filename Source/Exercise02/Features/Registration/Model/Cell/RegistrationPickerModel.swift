//
//  RegistrationPickerModel.swift
//  Exercise02
//
//  Created by Calebe Emerick on 19/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class RegistrationPickerModel {
	
	let label: String
	let placeholder: String
	let lineColor: CGColor
	let keyboardView: KeyboardDatePicker
	let keyboardCustomView: KeyboardAccessoryView
	let dateConverter: DateConverter
	
	init(label: String, placeholder: String) {
		self.label = label
		self.placeholder = placeholder
		lineColor = Color(hexString: "#ccc").cgColor
		keyboardView = KeyboardDatePicker.makeXib()
		keyboardCustomView = KeyboardAccessoryView(button: "Selecionar")
		dateConverter = DateConverter()
	}
}

extension RegistrationPickerModel: RegistrationCellProtocol {
	
	var type: RegistrationCellType {
		return .picker
	}
	
	var height: CGFloat {
		return 60
	}
}
