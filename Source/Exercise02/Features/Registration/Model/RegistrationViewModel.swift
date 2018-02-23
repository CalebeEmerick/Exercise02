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
	
	private(set) var state: RegistrationState = .invalid {
		didSet {
			callUpdateButtonWhenStateChange(oldValue)
		}
	}
	
	let registrationValidator = RegistrationValidator()
	
	init(fetcher: RetrieveHeadlines, validators: ContainerValidator) {
		self.validators = validators
		headlinesFetcher = fetcher
	}
	
	var didUpdateButtonState: ((Bool) -> Void)?
	
	var didChangeFocusTo: ((IndexPath) -> Void)?
	
	var didOpenPickerKeyboard: ((IndexPath) -> Void)?
	
	func getHeadlines() -> [RegistrationCellProtocol] {
		return headlinesFetcher.fetch()
	}
	
	private func callUpdateButtonWhenStateChange(_ oldState: RegistrationState) {
		if oldState != state {
			didUpdateButtonState?(state.isValid)
		}
	}
	
	private func verifyRegistrationStatus() {
		let isAllFieldsValid = registrationValidator.isAllFieldsValid
		let state = RegistrationState(isValid: isAllFieldsValid)
		self.state = state
	}
}

// MARK: - RegistrationCellKeyboardButtonCapture -

extension RegistrationViewModel: RegistrationCellKeyboardButtonCapture {
	
	func changeFieldFocus(for model: RegistrationFieldModel) {
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
}

// MARK: - RegistrationState -

extension RegistrationViewModel {
	
	enum RegistrationState {
		
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
		
		var isValid: Bool {
			switch self {
			case .valid:
				return true
			case .invalid:
				return false
			}
		}
	}
}

// MARK: - RegistrationValidator -

extension RegistrationViewModel {
	
	final class RegistrationValidator {
		
		typealias Property = (field: String, isValid: Bool)
		
		var name: Property = (field: "", isValid: false)
		var email: Property = (field: "", isValid: false)
		var phone: Property = (field: "", isValid: false)
		var companyName: Property = (field: "", isValid: false)
		var cnpj: Property = (field: "", isValid: false)
		var date: Property = (field: "", isValid: false)
		var isMei: Bool = false
		
		var isAllFieldsValid: Bool {
			print("name: \(name.isValid)")
			print("email: \(email.isValid)")
			print("phone: \(phone.isValid)")
			print("companyName: \(companyName.isValid)")
			print("cnpj: \(cnpj.isValid)")
			print("date: \(date.isValid)")
			return name.isValid &&
				email.isValid &&
				phone.isValid &&
				companyName.isValid &&
				cnpj.isValid &&
				date.isValid
		}
		
		var contact: Contact {
			let company = Company(name: companyName.field, cnpj: cnpj.field, activeSince: date.field, isMei: isMei)
			let contact = Contact(name: name.field, email: email.field, phone: phone.field, company: company)
			return contact
		}
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
			registrationValidator.name = (field: text, isValid: result)
		case .email:
			let result = validators.emailValidator.validate(email: text)
			color = RegistrationCellFieldState(isValid: result).color
			registrationValidator.email = (field: text, isValid: result)
		case .phone:
			let result = validators.phoneValidator.validate(phone: text)
			color = RegistrationCellFieldState(isValid: result).color
			registrationValidator.phone = (field: text, isValid: result)
		case .companyName:
			let result = validators.companyNameValidator.validate(name: text)
			color = RegistrationCellFieldState(isValid: result).color
			registrationValidator.companyName = (field: text, isValid: result)
		case .cnpj:
			let result = validators.cnpjValidator.validate(cnpj: text)
			color = RegistrationCellFieldState(isValid: result).color
			registrationValidator.cnpj = (field: text, isValid: result)
		}
		
		verifyRegistrationStatus()
		
		return color
	}
}

// MARK: - RegistrationCellDateCapture -

extension RegistrationViewModel: RegistrationCellDateCapture {
	
	func validate(_ text: String) -> CGColor {
		let result = validators.dateValidator.validate(date: text)
		let color = RegistrationCellFieldState(isValid: result).color
		registrationValidator.date = (field: text, isValid: result)
		
		verifyRegistrationStatus()
		return color
	}
}

// MARK: - RegistrationCellSwitchCapture -

extension RegistrationViewModel: RegistrationCellSwitchCapture {
	
	func isMeiChanged(to status: Bool) {
		registrationValidator.isMei = status
		verifyRegistrationStatus()
	}
}
