//
//  ContactDetail.swift
//  Exercise02
//
//  Created by Calebe Emerick on 26/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class ContactDetail {
	
	let title: String
	let contact: Contact
	
	init(title: String, contact: Contact) {
		self.title = title
		self.contact = contact
	}
}
