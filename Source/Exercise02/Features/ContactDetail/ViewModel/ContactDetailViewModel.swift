//
//  ContactDetailViewModel.swift
//  Exercise02
//
//  Created by Calebe Emerick on 26/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class ContactDetailViewModel {
	
	private let emailSender: EmailSend
	private let phoneCaller: Caller
	private let phoneFormatter: PhoneFormatter
	private let cnpjFormatter: CNPJFormatter
	private let meiFormatter: MEIFormatter
	
	init(phoneFormatter: PhoneFormatter, cnpjFormatter: CNPJFormatter,
		  meiFormatter: MEIFormatter, phoneCaller: Caller,
		  emailSender: EmailSend) {
		self.phoneCaller = phoneCaller
		self.phoneFormatter = phoneFormatter
		self.cnpjFormatter = cnpjFormatter
		self.meiFormatter = meiFormatter
		self.emailSender = emailSender
	}
	
	var didDeselectCell: ((IndexPath) -> Void)?
	
	func getContactDetail(_ contact: Contact) -> [ContactDetailCellModel] {
		let name = ContactDetailCellModel(type: .companyName(contact.company.name))
		let owner = ContactDetailCellModel(type: .companyOwner(contact.name))
		let email = ContactDetailCellModel(type: .email(contact.email))
		let formattedPhone = getFormattedPhone(contact.phone)
		let phone = ContactDetailCellModel(type: .phone(formattedPhone))
		let cnpjFormatted = getCnpjFormatted(contact.company.cnpj)
		let cnpj = ContactDetailCellModel(type: .cnpj(cnpjFormatted))
		let date = ContactDetailCellModel(type: .activeSince(contact.company.activeSince))
		let isMeiFormatted = getMeiFormatted(contact.company.isMei)
		let isMei = ContactDetailCellModel(type: .isMei(isMeiFormatted))
		
		return [name, owner, email, phone, cnpj, date, isMei]
	}
	
	func executeActionForCellTap(with model: ContactDetailCellModel,
										  for indexPath: IndexPath) {
		
		switch model.fieldType {
		case let .phone(phone):
			makeCall(for: phone)
		case let .email(email):
			sendMessage(to: email)
		default:
			break
		}
		didDeselectCell?(indexPath)
	}
	
	private func makeCall(for phone: String) {
		phoneCaller.call(to: phone)
	}
	
	private func sendMessage(to email: String) {
		emailSender.send(to: email)
	}
	
	private func getFormattedPhone(_ phone: String) -> String {
		return phoneFormatter.format(phone)
	}
	
	private func getCnpjFormatted(_ cnpj: String) -> String {
		return cnpjFormatter.format(cnpj)
	}
	
	private func getMeiFormatted(_ isMei: Bool) -> String {
		return meiFormatter.format(isMei)
	}
}
