//
//  ContactRemover.swift
//  Exercise02
//
//  Created by Calebe Emerick on 27/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class ContactRemover: ContactRemovable {
	
	private let fetcher: RetrieveContacts
	private let saver: SaveContact
	private let userDefaults: UserDefaults
	private let key: String
	
	init() {
		fetcher = ContactsFetcher()
		saver = ContactSaver()
		userDefaults = UserDefaults.standard
		key = kContactList
	}
	
	init(fetcher: RetrieveContacts, saver: SaveContact, userDefaults: UserDefaults, key: String) {
		self.fetcher = fetcher
		self.saver = saver
		self.userDefaults = userDefaults
		self.key = key
	}
	
	
	func delete(_ contact: Contact) {
		
		var contacts = fetcher.fetchContacts()
		
		guard contacts.contains(contact) else {
			return
		}
		
		let index = getIndex(from: contact, in: contacts)
		
		contacts.remove(at: index)
		
		saver.replace(to: contacts)
	}
	
	private func getIndex(from contact: Contact, in contacts: [Contact]) -> Int {
		var contactIndex = 0
		for (index, innerContact) in contacts.enumerated() where innerContact == contact {
			contactIndex = index
			break
		}
		return contactIndex
	}
}
