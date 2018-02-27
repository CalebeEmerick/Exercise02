//
//  ContactsFetcher.swift
//  Exercise02
//
//  Created by Calebe Emerick on 16/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class ContactsFetcher: RetrieveContacts {
	
	private let userDefaults: UserDefaults
	private let kContactKey: String
	
	init(userDefaults: UserDefaults = UserDefaults.standard, key: String = kContactList) {
		self.userDefaults = userDefaults
		kContactKey = key
	}
	
	func fetchContacts() -> [Contact] {
		guard let json = userDefaults.object(forKey: kContactKey) as? JSON else {
			return []
		}
		
		guard let contactList = ContactList(json: json) else {
			return []
		}
		
		return contactList.contacts
	}
}
