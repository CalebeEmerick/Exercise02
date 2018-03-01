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
		setUpdateListObserver()
	}
	
	enum FetchState {
		case success([ClientModel])
		case empty
	}
	
	var didFetchContacts: (([ClientModel]) -> Void)?
	
	var didFetchEmptyContacts: (() -> Void)?
	
	var didUpdateContacts: (([ClientModel]) -> Void)?
	
	var openContactDetail: ((Contact) -> Void)?
	
	func fetchClients() {
		let contacts = contactsFetcher.fetchContacts()
		let clients = map(contacts: contacts)
		show(clients: clients)
	}
	
	func openDetail(for indexPath: IndexPath) {
		let contacts = contactsFetcher.fetchContacts()
		if contacts.count > indexPath.row {
			let contact = contacts[indexPath.row]
			openContactDetail?(contact)
		}
	}
	
	private func map(contacts: [Contact]) -> [ClientModel] {
		return contacts.map { ClientModel(contact: $0) }
	}
	
	private func setUpdateListObserver() {
		NotificationCenter.default
			.addObserver(self, selector: #selector(updateList),
							 name: Observer.Home.kUpdateContactList, object: nil)
	}
	
	private func show(clients: [ClientModel]) {
		if clients.isEmpty {
			didFetchEmptyContacts?()
		}
		else {
			didFetchContacts?(clients)
		}
	}
	
	@objc private func updateList(from notification: Notification) {
		guard let contacts = notification.object as? [Contact] else { return }
		let clientModels = map(contacts: contacts)
		didUpdateContacts?(clientModels)
	}
}
