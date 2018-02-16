//
//  ContactList.swift
//  Exercise02
//
//  Created by Calebe Emerick on 16/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class ContactList {
	
	private let kContacts = "contacts"
	
	let contacts: [Contact]
	
	init(contacts: [Contact]) {
		self.contacts = contacts
	}
	
	init(json: JSON) {
		guard let jsonList = json[kContacts] as? [JSON] else {
			self.contacts = []
			return
		}
		
		let contacts = jsonList.flatMap { Contact(json: $0) }
		
		self.contacts = contacts
	}
	
	var json: JSON {
		return [
			kContacts: jsonContactList
		]
	}
	
	private var jsonContactList: [JSON] {
		return contacts.map { $0.json }
	}
}
