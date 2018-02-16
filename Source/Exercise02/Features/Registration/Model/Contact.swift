//
//  Contact.swift
//  Exercise02
//
//  Created by Calebe Emerick on 07/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

struct Contact {

	let name: String
	let email: String
	let phone: String
	let company: Company

	init(name: String, email: String, phone: String, company: Company) {
		self.name = name
		self.email = email
		self.phone = phone
		self.company = company
	}
	
	private let kName = "name"
	private let kEmail = "email"
	private let kPhone = "phone"
	private let kCompany = "company"
}

extension Contact {
	
	init?(json: JSON) {
		guard let name = json[kName] as? String,
			let email = json[kEmail] as? String,
			let phone = json[kPhone] as? String,
			let companyJSON = json[kCompany] as? JSON,
			let company = Company(json: companyJSON)
			else {
				return nil
		}
		
		self.name = name
		self.email = email
		self.phone = phone
		self.company = company
	}
	
	var json: JSON {
		return [
			kName: name,
			kEmail: email,
			kPhone: phone,
			kCompany: company.json
		]
	}
}
