//
//  ContactListModelTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 16/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class ContactListModelTests: XCTestCase {
	
	private let validContactList: [Contact] = [
		Contact(name: "João da Silva", email: "joaosilva@gmail.com", phone: "21973459921", company: Company(name: "Coca Cola", cnpj: "22951114000150", activeSince: "10/10/2001", isMei: true)),
		
		Contact(name: "Maria Azevedo", email: "mariazev@hotmail.com", phone: "21998345602", company: Company(name: "Google", cnpj: "70128653000136", activeSince: "01/01/1999", isMei: false))
	]
	
	private var validListOfContactsJSON: [JSON] {
		return [
			[
				"name": "João da Silva",
				"email": "joaosilva@gmail.com",
				"phone": "21973459921",
				"company": [
					"name": "Coca Cola",
					"cnpj": "22951114000150",
					"active_since": "10/10/2001",
					"is_mei": true
				]
			],
			[
				"name": "Maria Azevedo",
				"email": "mariazev@hotmail.com",
				"phone": "21998345602",
				"company": [
					"name": "Google",
					"cnpj": "70128653000136",
					"active_since": "01/01/1999",
					"is_mei": false
				]
			]
		]
	}
	
	private var invalidListOfContactsJSON: [JSON] {
		return [
			[
				"name": "João da Silva",
				"email": "joaosilva@gmail.com",
				"phone": "21973459921",
				"company": [
					"name": "Coca Cola",
					"cnpj": "22951114000150",
					"activeSince": "10/10/2001",
					"isMei": true
				]
			],
			[
				"name": "Maria Azevedo",
				"email": "mariazev@hotmail.com",
				"phone": "21998345602",
				"company": [
					"name": "Google",
					"cnpj": "70128653000136",
					"activeSince": "01/01/1999",
					"isMei": false
				]
			]
		]
	}
	
	func test_contactListShouldNotBeNil_When_AValidJSONIsPassed() {
		
		let json: JSON = [ContactList.kContacts: validListOfContactsJSON]
		
		let contactList = ContactList(json: json)
		
		expect(contactList).toNot(beNil())
	}
	
	func test_contactListShouldBeNil_When_AInvalidJSONIsPassed() {
		
		let invalidJSON: JSON = ["InvalidKey": "InvalidValue"]
		let json: JSON = [ContactList.kContacts: invalidJSON]
		
		let contactList = ContactList(json: json)
		
		expect(contactList).to(beNil())
	}
	
	func test_contactListShouldBeEmpty_When_AInvalidJSONArrayOfContactsIsPassed() {
		
		let json: JSON = [ContactList.kContacts: invalidListOfContactsJSON]
		
		let contactList = ContactList(json: json)
		
		expect(contactList).toNot(beNil())
		expect(contactList?.contacts).to(beEmpty())
	}
	
	func test_contactListJsonPropertyShouldBeValid_When_ParsingTheJSONToContactListModel() {
		
		let model = ContactList(contacts: validContactList)
		
		let contactList = ContactList(json: model.json)
		
		expect(contactList).toNot(beNil())
	}
}
