//
//  ContactModelTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 16/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class ContactModelTests: XCTestCase {
	
	private var validContact: Contact {
		return Contact(
			name: "João da Silva",
			email: "joaosilva@gmail.com",
			phone: "21973459921",
			company:
				Company(
					name: "Coca Cola",
					cnpj: "22951114000150",
					activeSince: "10/10/2001",
					isMei: true
				)
		)
	}
	
	private var validContactJSON: JSON {
		return [
			"name": "João da Silva",
			"email": "joaosilva@gmail.com",
			"phone": "21973459921",
			"company": [
				"name": "Coca Cola",
				"cnpj": "22951114000150",
				"active_since": "10/10/2001",
				"is_mei": true
			]
		]
	}
	
	private var invalidContactJSON: JSON {
		return [
			"name": "João da Silva",
			"email": "joaosilva@gmail.com",
			"phone": "21973459921",
			"company": [
				"name": "Coca Cola",
				"cnpj": "22951114000150",
				"activeSince": "10/10/2001",
				"isMei": true
			]
		]
	}
	
	func test_contactShouldNotBeNil_When_AValidJSONIsPassed() {
		
		let contact = Contact(json: validContactJSON)
		
		expect(contact).toNot(beNil())
	}
	
	func test_contactShouldBeNil_When_AInvalidJSONIsPassed() {
		
		let contact = Contact(json: invalidContactJSON)
		
		expect(contact).to(beNil())
	}
	
	func test_contactJsonPropertyShouldBeValid_When_ParsingTheJSONToContactModel() {
		
		let contactJSON = validContact.json

		let contact = Contact(json: contactJSON)
		
		expect(contact).toNot(beNil())
	}
}
