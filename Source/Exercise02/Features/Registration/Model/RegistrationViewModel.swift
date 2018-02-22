//
//  RegistrationViewModel.swift
//  Exercise02
//
//  Created by Calebe Emerick on 19/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class RegistrationViewModel {
	
	private let headlinesFetcher: RetrieveHeadlines
	private let validators: ContainerValidator
	
	init(fetcher: RetrieveHeadlines, validators: ContainerValidator) {
		self.validators = validators
		headlinesFetcher = fetcher
		registerKeyboardButtonNotification()
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
	var didChangeFocusTo: ((IndexPath) -> Void)?
	
	var didOpenPickerKeyboard: ((IndexPath) -> Void)?
	
	var didTintFieldLine: ((CGColor) -> Void)?
	
	func getHeadlines() -> [RegistrationCellProtocol] {
		return headlinesFetcher.fetch()
	}
	
	private func registerKeyboardButtonNotification() {
		let notification = NotificationCenter.default
		notification.addObserver(self, selector: #selector(didTapKeyboardButton), name: Observer.Registration.kPressedKeyboardButton, object: nil)
	}
	
	private func changeTextFieldFocus(for model: RegistrationFieldModel) {
		switch model.fieldType {
		case .name, .email, .phone, .companyName:
			let index = getCurrentModelIndex(model: model)
			let indexPath = makeIndexPath(for: index + 1)
			didChangeFocusTo?(indexPath)
		case .cnpj:
			let index = getPickerIndex()
			let indexPath = makeIndexPath(for: index)
			didOpenPickerKeyboard?(indexPath)
		}
	}
	
	private func getCurrentModelIndex(model: RegistrationFieldModel) -> Int {
		let items = headlinesFetcher.fetch()
		let index = getIndex(for: model.fieldType, from: items)
		return index
	}
	
	private func getIndex(for type: RegistrationFieldType, from items: [RegistrationCellProtocol]) -> Int {
		var itemIndex = 0
		for (index, item) in items.enumerated() {
			
			if let item = item as? RegistrationFieldModel,
				item.fieldType == type {
				
				itemIndex = index
				break
			}
		}
		return itemIndex
	}
	
	private func makeIndexPath(for index: Int) -> IndexPath {
		return IndexPath(row: index, section: 0)
	}
	
	private func getPickerIndex() -> Int {
		let items = headlinesFetcher.fetch()
		var itemIndex = 0
		for (index, item) in items.enumerated() where item.type == .picker {
			
			itemIndex = index
			break
		}
		return itemIndex
	}
	
	@objc private func didTapKeyboardButton(notification: Notification) {
		guard let model = notification.object as? RegistrationFieldModel else { return }
		changeTextFieldFocus(for: model)
	}
}

// MARK: - RegistrationCellFieldCapture -

extension RegistrationViewModel: RegistrationCellFieldCapture {
	
	func validate(_ text: String, for type: RegistrationFieldModel) -> CGColor {
		let color: CGColor
		
		switch type.fieldType {
		case .name:
			let result = validators.nameValidator.validate(text: text)
			color = RegistrationCellFieldState(isValid: result).color
		case .email:
			let result = validators.emailValidator.validate(email: text)
			color = RegistrationCellFieldState(isValid: result).color
		case .phone:
			let result = validators.phoneValidator.validate(phone: text)
			color = RegistrationCellFieldState(isValid: result).color
		case .companyName:
			let result = validators.companyNameValidator.validate(name: text)
			color = RegistrationCellFieldState(isValid: result).color
		case .cnpj:
			let result = validators.cnpjValidator.validate(cnpj: text)
			color = RegistrationCellFieldState(isValid: result).color
		}
		
		return color
	}
}

// MARK: - RegistrationCellDateCapture -

extension RegistrationViewModel: RegistrationCellDateCapture {
	
	func validate(_ text: String) -> CGColor {
		let result = validators.dateValidator.validate(date: text)
		let color = RegistrationCellFieldState(isValid: result).color
		return color
	}
}
