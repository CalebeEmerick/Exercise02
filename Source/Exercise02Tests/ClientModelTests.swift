//
//  ClientModelTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 10/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import XCTest
import Nimble

final class ClientModelTests: XCTestCase {
	
	private var contact: Contact!
	
	override func setUp() {
		super.setUp()
		
		contact = Contact(name: "João da Silva", email: "joaosilva@gmail.com", phone: "21973459921", company: Company(name: "Coca-Cola", cnpj: "22951114000150", activeSince: Date(), isMEI: true))
	}
	
	override func tearDown() {
		contact = nil
		
		super.tearDown()
	}
	
	func test_shouldTransformContact_InToClientModel() {
		
		let model = ClientModel(contact: contact)
		
		expect(model.companyName) == contact.company.name
		expect(model.companyOwnerName) == contact.name
	}
}
