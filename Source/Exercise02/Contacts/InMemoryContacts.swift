//
//  InMemoryContacts.swift
//  Exercise02
//
//  Created by Calebe Emerick on 10/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class InMemoryContacts: RetrieveContacts {

	let quantity: Int
	
	init(quantityOfContacts quantity: Int) {
		self.quantity = quantity
	}
	
	func fetchContacts() -> [Contact] {
		var contacts: [Contact] = []
		
		guard quantity >= 0 else {
			return contacts
		}
		
		for _ in 0 ..< quantity {
			let contact = getNewContact()
			contacts.append(contact)
		}
		
		return contacts
	}
	
	private func getNewContact() -> Contact {
		let numberOfContacts = UInt32(contacts.count)
		let randomNumber = Int(arc4random_uniform(numberOfContacts))
		
		return contacts[randomNumber]
	}
	
	private var contacts: [Contact] {
		return [
			Contact(name: "João da Silva", email: "joaosilva@gmail.com", phone: "21973459921", company: Company(name: "Coca Cola", cnpj: "22951114000150", activeSince: Date(), isMei: true)),
			
			Contact(name: "Maria Azevedo", email: "mariazev@hotmail.com", phone: "21998345602", company: Company(name: "Google", cnpj: "70128653000136", activeSince: Date(), isMei: false)),
			
			Contact(name: "Rodrigo Santos", email: "rodrigo@santos.com", phone: "21986530092", company: Company(name: "Apple", cnpj: "16081048000101", activeSince: Date(), isMei: false)),
			
			Contact(name: "Luciana da Costa", email: "luciana.costa@bol.com.br", phone: "21998467702", company: Company(name: "Empresa Com Quatro Nomes", cnpj: "15928944000109", activeSince: Date(), isMei: false))
		]
	}
}
