//
//  ContactsFetcher.swift
//  Exercise02
//
//  Created by Calebe Emerick on 16/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class ContactsFetcher : RetrieveContacts {
	
	private let userDefaults: UserDefaults
	
	init(userDefaults: UserDefaults = UserDefaults.standard) {
		self.userDefaults = userDefaults
	}
	
	func fetchContacts() -> [Contact] {
		guard let json = userDefaults.object(forKey: kContactList) as? JSON else {
			return []
		}
		
		let contactList = ContactList(json: json)
		
		return contactList.contacts
	}
}
