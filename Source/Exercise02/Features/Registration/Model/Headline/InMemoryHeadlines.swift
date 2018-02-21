//
//  InMemoryHeadlines.swift
//  Exercise02
//
//  Created by Calebe Emerick on 21/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class InMemoryHeadlines: RetrieveHeadlines {
	
	func fetch() -> [RegistrationCellProtocol] {
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
}
