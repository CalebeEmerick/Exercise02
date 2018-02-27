//
//  RegistrationViewModelTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 23/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class RegistrationViewModelTests: XCTestCase {
	
	private var fetcher: InMemoryHeadlines!
	private var saver: ContactSaver!
	private var validators: ContainerValidator!
	private var viewModel: RegistrationViewModel!
	
	private let validColor = RegistrationCellFieldState.valid.color
	private let invalidColor = RegistrationCellFieldState.invalid.color
	
	private enum Models {
		
		case name
		case email
		case phone
		case companyName
		case cnpj
		
		var model: RegistrationFieldModel {
			switch self {
			case .name:
				return RegistrationFieldModel(type: .name(""))
			case .email:
				return RegistrationFieldModel(type: .email(""))
			case .phone:
				return RegistrationFieldModel(type: .phone(""))
			case .companyName:
				return RegistrationFieldModel(type: .companyName(""))
			case .cnpj:
				return RegistrationFieldModel(type: .cnpj(""))
			}
		}
	}
	
	private func validate(_ text: String, for model: Models) -> CGColor {
		return viewModel.validate(text, for: model.model)
	}
	
	override func setUp() {
		super.setUp()
		
		fetcher = InMemoryHeadlines()
		saver = ContactSaver()
		
		let nameValidator = NameValidator()
		let emailValidator = EmailValidator()
		let phoneValidator = PhoneValidator()
		let companyNameValidator = CompanyNameValidator()
		let cnpjValidator = CNPJValidator()
		let dateValidator = DateValidator()
		
		validators = ContainerValidator(name: nameValidator,
												  email: emailValidator,
												  phone: phoneValidator,
												  companyName: companyNameValidator,
												  cnpj: cnpjValidator,
												  date: dateValidator
		)
		
		viewModel = RegistrationViewModel(fetcher: fetcher, saver: saver, validators: validators)
	}
	
	override func tearDown() {
		fetcher = nil
		validators = nil
		viewModel = nil
		
		super.tearDown()
	}
	
	func test_shouldBeRight_Color_ForValidName() {
		
		let color = validate("Name LastName", for: .name)
		
		expect(color).to(equal(validColor))
	}
	
	func test_shouldBeRight_Color_ForInvalidName() {
		
		let color = validate("Name", for: .name)
		
		expect(color).to(equal(invalidColor))
	}
	
	func test_shouldBeRight_Color_ForValidEmail() {
		
		let color = validate("test@testing.com", for: .email)
		
		expect(color).to(equal(validColor))
	}
	
	func test_shouldBeRight_Color_ForInvalidEmail() {
		
		let color = validate("test@testing", for: .email)
		
		expect(color).to(equal(invalidColor))
	}
	
	func test_shouldBeRight_Color_ForValidPhone() {
		
		let color = validate("(21) 971697123", for: .phone)
		
		expect(color).to(equal(validColor))
	}
	
	func test_shouldBeRight_Color_ForInvalidPhone() {
		
		let color = validate("21-971697123", for: .phone)
		
		expect(color).to(equal(invalidColor))
	}
	
	func test_shouldBeRight_Color_ForValidCompanyName() {
		
		let color = validate("Company Name", for: .companyName)
		
		expect(color).to(equal(validColor))
	}
	
	func test_shouldBeRight_Color_ForInvalidCompanyName() {
		
		let color = validate("C", for: .companyName)
		
		expect(color).to(equal(invalidColor))
	}
	
	func test_shouldBeRight_Color_ForValidCNPJ() {
		
		let color = validate("16.501.555/0001-57", for: .cnpj)
		
		expect(color).to(equal(validColor))
	}
	
	func test_shouldBeRight_Color_ForInvalidCNPJ() {
		
		let color = validate("16.501.555000157", for: .cnpj)
		
		expect(color).to(equal(invalidColor))
	}
	
	func test_shouldBeRight_Color_ForValidDate() {
		
		let color = viewModel.validate("10/06/2015")
		
		expect(color).to(equal(validColor))
	}
	
	func test_shouldBeRight_Color_ForInvalidDate() {
		
		let color = viewModel.validate("29/02/2005")
		
		expect(color).to(equal(invalidColor))
	}
	
	func test_shouldBeInValid_TheViewModelInitialState() {
		
		expect(self.viewModel.state)
			.to(equal(RegistrationViewModel.RegistrationState.invalid))
	}
	
	func test_shouldBeValid_TheViewModelState_WhenAllFieldsAreValid() {
		
		_ = validate("Calebe Emerick", for: .name)
		_ = validate("cemerik@stone.com.br", for: .email)
		_ = validate("21 971697123", for: .phone)
		_ = validate("Stone Pagamentos", for: .companyName)
		_ = validate("16.501.555/0001-57", for: .cnpj)
		_ = viewModel.validate("15/02/2013")
		viewModel.isMeiChanged(to: false)
		
		expect(self.viewModel.state)
			.to(equal(RegistrationViewModel.RegistrationState.valid))
	}
	
	func test_shouldBeInvalid_TheViewModelState_WhenAtLeastOneFieldIsInvalid() {
		
		_ = validate("Calebe Emerick", for: .name)
		_ = validate("bad@email", for: .email)
		_ = validate("21 971697123", for: .phone)
		_ = validate("Stone Pagamentos", for: .companyName)
		_ = validate("16.501.555/0001-57", for: .cnpj)
		_ = viewModel.validate("15/02/2013")
		viewModel.isMeiChanged(to: true)
		
		expect(self.viewModel.state)
			.to(equal(RegistrationViewModel.RegistrationState.invalid))
	}
	
	func test_viewModelContact_ShouldBeEqual_TheContactGeneratedWithTheSameInformation() {
		
		let name = "Calebe Emerick"
		let email = "cemerik@stone.com.br"
		let phone = "21 971697123"
		let companyName = "Stone Pagamentos"
		let cnpj = "16.501.555/0001-57"
		let activeSince = "15/02/2013"
		let isMei = true
		
		let contact = Contact(name: name, email: email, phone: phone, company: Company(name: companyName, cnpj: cnpj, activeSince: activeSince, isMei: isMei))
		
		_ = validate(name, for: .name)
		_ = validate(email, for: .email)
		_ = validate(phone, for: .phone)
		_ = validate(companyName, for: .companyName)
		_ = validate(cnpj, for: .cnpj)
		_ = viewModel.validate(activeSince)
		viewModel.isMeiChanged(to: isMei)
		
		let viewModelContact = viewModel.registrationValidator.contact
		
		expect(viewModelContact).to(equal(contact))
	}
}
