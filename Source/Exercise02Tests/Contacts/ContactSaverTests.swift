//
//  ContactSaverTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 23/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class ContactSaverTests: XCTestCase {
	
	private let domain = "ContactSaverTests"
	private let key = "ContactKey"
	private var userDefaults: UserDefaults!
	private var saver: ContactSaver!
	private var fetcher: ContactsFetcher!
	
	private var contact: Contact {
		return Contact(name: "Calebe Emerick",
							email: "cemerik@stone.com.br",
							phone: "21 971697123",
							company: Company(name: "Stone Pagamentos",
												  cnpj: "16.501.555/0001-57",
												  activeSince: "15/02/2013",
												  isMei: true
			)
		)
	}
	
	override func setUp() {
		super.setUp()
		
		userDefaults = UserDefaults(suiteName: domain)
		fetcher = ContactsFetcher(userDefaults: userDefaults, key: key)
		saver = ContactSaver(fetcher: fetcher, userDefaults: userDefaults, key: key)
	}
	
	override func tearDown() {
		userDefaults.removeObject(forKey: key)
		userDefaults.removeSuite(named: domain)
		userDefaults = nil
		saver = nil
		fetcher = nil
		
		super.tearDown()
	}
	
	func test_shouldHave_OneContact_AfterSave() {
		
		saver.save(contact)
		
		let contacts = fetcher.fetchContacts()
		
		expect(contacts.count).to(equal(1))
	}
	
	func test_should_() {
		
		let contacts = saver.save(contact)
		
		let hasContactInContacts = contacts.contains(contact)
		
		expect(hasContactInContacts).to(beTrue())
	}
}
