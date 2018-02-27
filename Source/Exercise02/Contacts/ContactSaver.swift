//
//  ContactSaver.swift
//  Exercise02
//
//  Created by Calebe Emerick on 23/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class ContactSaver: SaveContact {
	
	private let fetcher: RetrieveContacts
	private let userDefaults: UserDefaults
	private let key: String
	
	init() {
		fetcher = ContactsFetcher()
		userDefaults = UserDefaults.standard
		key = kContactList
	}
	
	init(fetcher: RetrieveContacts, userDefaults: UserDefaults, key: String) {
		self.fetcher = fetcher
		self.userDefaults = userDefaults
		self.key = key
	}
	
	@discardableResult
	func save(_ contact: Contact) -> [Contact] {
		
		var contacts = fetcher.fetchContacts()
		
		contacts.append(contact)
		
		saveContacts(contacts)
		
		return contacts
	}
	
	func replace(to contacts: [Contact]) {
		saveContacts(contacts)
	}
	
	private func saveContacts(_ contacts: [Contact]) {
		let contactList = ContactList(contacts: contacts)
		userDefaults.set(contactList.json, forKey: key)
	}
}
