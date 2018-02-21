//
//  RetrieveHeadlinesMock.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 21/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Foundation

final class RetrieveHeadlinesMock: RetrieveHeadlines {
	
	func fetch() -> [RegistrationCellProtocol] {
		return [
			RegistrationFieldModel(type: .name("Nome e sobrenome")),
			RegistrationFieldModel(type: .email("E-mail")),
			RegistrationFieldModel(type: .phone("Telefone celular")),
			RegistrationFieldModel(type: .companyName("Nome fantasia")),
			RegistrationFieldModel(type: .cnpj("CNPJ")),
			RegistrationPickerModel(label: "Ativa desde", placeholder: "ex: 10/05/1954"),
			RegistrationSwitchModel(label: "É MEI?")
		]
	}
}
