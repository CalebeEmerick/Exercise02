//
//  HomeViewModel.swift
//  Exercise02
//
//  Created by Calebe Emerick on 08/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class HomeViewModel {
	
	private let contactsFetcher: RetrieveContacts
	
	init(fetcher: RetrieveContacts) {
		contactsFetcher = fetcher
	}
	
	enum FetchState {
		case success([ClientModel])
		case empty
	}
	
	var didFetchContacts: (([ClientModel]) -> Void)?
	var didFetchEmptyContacts: (() -> Void)?
	
	func fetchClients() {
		let contacts = contactsFetcher.fetchContacts()
		let clients = map(contacts: contacts)
		show(clients: clients)
	}
	
	private func map(contacts: [Contact]) -> [ClientModel] {
		return contacts.map { ClientModel(contact: $0) }
	}
	
	private func show(clients: [ClientModel]) {
		if clients.isEmpty {
			didFetchEmptyContacts?()
		}
		else {
			didFetchContacts?(clients)
		}
	}
}
