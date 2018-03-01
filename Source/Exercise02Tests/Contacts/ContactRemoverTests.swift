//
//  ContactRemoverTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 27/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class ContactRemoverTests: XCTestCase {
	
	private let domain = "ContactRemoverTests"
	private let key = "ContactKey"
	private var userDefaults: UserDefaults!
	private var saver: SaveContact!
	private var fetcher: RetrieveContacts!
	private var remover: ContactRemovable!
	
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
		remover = ContactRemover(fetcher: fetcher, saver: saver, userDefaults: userDefaults, key: key)
	}
	
	override func tearDown() {
		userDefaults.removeObject(forKey: key)
		userDefaults.removeSuite(named: domain)
		saver = nil
		fetcher = nil
		remover = nil
		userDefaults = nil
		
		super.tearDown()
	}
	
	func test_shouldRemove_Contact() {
		
		saver.save(contact)
		
		let contacts = fetcher.fetchContacts()
		
		let isContactSave = contacts.contains(contact)
		
		expect(isContactSave).to(beTrue())
		
		remover.delete(contact)
		
		let emptyContacts = fetcher.fetchContacts()
		
		expect(emptyContacts).to(beEmpty())
	}
}
