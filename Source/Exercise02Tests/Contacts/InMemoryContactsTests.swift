//
//  InMemoryContactsTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 16/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class InMemoryContactsTests: XCTestCase {
	
	private var memoryContacts: InMemoryContacts!
	
	override func tearDown() {
		memoryContacts = nil
		
		super.tearDown()
	}
	
	func test_shouldReturnEmptyContacts_When_TheQuantityIsNegative() {
		
		memoryContacts = InMemoryContacts(quantityOfContacts: -2)
		
		let contacts = memoryContacts.fetchContacts()
		
		expect(contacts).to(beEmpty())
	}
	
	func test_shouldReturnTheNumberOfContacts_Equal_TheQuantityPassed() {
		
		let quantity = 9
		
		memoryContacts = InMemoryContacts(quantityOfContacts: quantity)
		
		let contacts = memoryContacts.fetchContacts()
		
		expect(contacts.count).to(equal(quantity))
	}
}
