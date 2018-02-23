//
//  ContainerValidator.swift
//  Exercise02
//
//  Created by Calebe Emerick on 22/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class ContainerValidator {
	
	let nameValidator: NameValidator
	let emailValidator: EmailValidator
	let phoneValidator: PhoneValidator
	let companyNameValidator: CompanyNameValidator
	let cnpjValidator: CNPJValidator
	let dateValidator: DateValidator
	
	init(name: NameValidator, email: EmailValidator, phone: PhoneValidator, companyName: CompanyNameValidator, cnpj: CNPJValidator, date: DateValidator) {
		nameValidator = name
		emailValidator = email
		phoneValidator = phone
		companyNameValidator = companyName
		cnpjValidator = cnpj
		dateValidator = date
	}
}
