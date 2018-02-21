//
//  KeyboardDatePicker.swift
//  Exercise02
//
//  Created by Calebe Emerick on 19/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

// MARK: - Initializers -

final class KeyboardDatePicker: UIView {
	
	@IBOutlet private var picker: UIDatePicker!
	
	@IBAction private func didChangeDate(_ picker: UIDatePicker) {
		selectedDate = picker.date
	}
	
	private(set) var selectedDate: Date = Date()
}

// MARK: - Life Cycle -

extension KeyboardDatePicker {
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		setupDatePicker()
	}
}

// MARK: - Methods -

extension KeyboardDatePicker {
	
	private func setupDatePicker() {
		picker.locale = Locale(identifier: "pt_BR")
		picker.datePickerMode = .date
		picker.maximumDate = Date()
	}
}
