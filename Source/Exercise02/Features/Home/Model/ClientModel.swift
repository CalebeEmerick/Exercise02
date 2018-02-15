//
//  ClientModel.swift
//  Exercise02
//
//  Created by Calebe Emerick on 08/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class ClientModel {
	
	let companyOwnerName: String
	let companyName: String
	let ownerInitialsName: String
	
	init(contact: Contact) {
		companyOwnerName = contact.name
		companyName = contact.company.name
		
		let initialsMaker = CompanyInitialsMaker()
		ownerInitialsName = initialsMaker.makeFor(company: companyName)
	}
}
