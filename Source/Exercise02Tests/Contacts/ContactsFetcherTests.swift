//
//  ContactsFetcherTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 16/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class ContactsFetcherTests: XCTestCase {
	
	private let domain = "ContactsFetcherTests"
	private let key = "ContactKey"
	private var userDefaults: UserDefaults!
	private var fetcher: ContactsFetcher!
	
	private let validContactList: [Contact] = [
		Contact(name: "João da Silva", email: "joaosilva@gmail.com", phone: "21973459921", company: Company(name: "Coca Cola", cnpj: "22951114000150", activeSince: Date(), isMei: true)),
		
		Contact(name: "Maria Azevedo", email: "mariazev@hotmail.com", phone: "21998345602", company: Company(name: "Google", cnpj: "70128653000136", activeSince: Date(), isMei: false))
	]
	
	override func setUp() {
		super.setUp()
		
		userDefaults = UserDefaults(suiteName: domain)
		cleanUserDefaults()
		fetcher = ContactsFetcher(userDefaults: userDefaults, key: key)
	}
	
	override func tearDown() {
		cleanUserDefaults()
		userDefaults = nil
		fetcher = nil
		
		super.tearDown()
	}
	
	func test_shouldReturnEmptyContacts_When_HasNotSavedContacts() {
		
		let contacts = fetcher.fetchContacts()
		
		expect(contacts).to(beEmpty())
	}
	
	func test_shouldReturnContacts_Equal_TheNumberOfSavedContacts() {
		
		let contactList = ContactList(contacts: validContactList)
		let numberOfContacts = contactList.contacts.count
		
		userDefaults.set(contactList.json, forKey: key)
		
		let contacts = fetcher.fetchContacts()
		
		expect(contacts.count) == numberOfContacts
	}
	
	private func cleanUserDefaults() {
		userDefaults.removeObject(forKey: key)
		userDefaults.removeSuite(named: domain)
	}
}
