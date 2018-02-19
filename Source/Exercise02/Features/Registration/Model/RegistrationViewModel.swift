//
//  RegistrationViewModel.swift
//  Exercise02
//
//  Created by Calebe Emerick on 19/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class RegistrationViewModel {
	
	init() {
		registerKeyboardButtonNotification()
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
	var didChangeFocusTo: ((IndexPath) -> Void)?
	
	var didDismissKeyboard: ((IndexPath) -> Void)?
	
	func getFieldItems() -> [RegistrationCellProtocol] {
		return [
			RegistrationFieldModel(type: .name("Nome Completo")),
			RegistrationFieldModel(type: .email("E-mail")),
			RegistrationFieldModel(type: .phone("Telefone para contato")),
			RegistrationFieldModel(type: .companyName("Nome Fantasia")),
			RegistrationFieldModel(type: .cnpj("CNPJ")),
			RegistrationPickerModel(label: "Ativa desde", placeholder: "ex: 10/05/1954"),
			RegistrationSwitchModel(label: "É MEI?")
		]
	}
	
	private func registerKeyboardButtonNotification() {
		let notification = NotificationCenter.default
		notification.addObserver(self, selector: #selector(didTapKeyboardButton), name: Observer.Registration.kPressedKeyboardButton, object: nil)
	}
	
	@objc private func didTapKeyboardButton(notification: Notification) {
		guard let model = notification.object as? RegistrationFieldModel else { return }
		changeTextFieldFocus(for: model)
	}
	
	private func changeTextFieldFocus(for model: RegistrationFieldModel) {
		let index = getCurrentModelIndex(model: model)
		
		switch model.fieldType {
		case .name, .email, .phone, .companyName:
			let indexPath = makeIndexPath(for: index + 1)
			didChangeFocusTo?(indexPath)
		case .cnpj:
			let indexPath = makeIndexPath(for: index)
			didDismissKeyboard?(indexPath)
		}
	}
	
	private func getCurrentModelIndex(model: RegistrationFieldModel) -> Int {
		let items = getFieldItems()
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
}
