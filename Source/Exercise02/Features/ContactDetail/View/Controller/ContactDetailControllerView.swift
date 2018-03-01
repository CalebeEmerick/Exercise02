//
//  ContactDetailControllerView.swift
//  Exercise02
//
//  Created by Calebe Emerick on 09/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

// MARK: - Initializers -

final class ContactDetailControllerView: UIView {
	
	@IBOutlet private var tableView: UITableView!
	
	@IBAction private func deleteAction() {
		showConfirmationAlert()
	}
	
	private let dataSource = ContactDetailDataSource()
	private let delegate = ContactDetailDelegate()
	
	var contactDetail: ContactDetail?
	
	weak var controller: ContactDetailController?
	
	weak var viewModel: ContactDetailViewModel? {
		didSet {
			delegate.viewModel = viewModel
		}
	}
}

// MARK: - Life Cycle -

extension ContactDetailControllerView {
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		setupTableView()
	}
}

// MARK: - Methods -

extension ContactDetailControllerView {
	
	func updateList(with details: [ContactDetailCellModel]) {
		dataSource.items = details
	}
	
	func reloadList() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
	
	func deselectRow(for indexPath: IndexPath) {
		DispatchQueue.main.async {
			self.tableView.deselectRow(at: indexPath, animated: true)
		}
	}
	
	func closeScreen() {
		DispatchQueue.main.async {
			self.controller?.navigationController?.popViewController(animated: true)
		}
	}
	
	private func setupTableView() {
		tableView.dataSource = dataSource
		tableView.delegate = delegate
		tableView.register(cellNib: ContactDetailCell.self)
	}
	
	private func showConfirmationAlert() {
		let alertController = UIAlertController(title: "Atenção", message: "Deseja realmente excluir o contato?", preferredStyle: .alert)
		let cancel = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel)
		let delete = UIAlertAction(title: "Excluir", style: .destructive) { [weak self] _ in
			self?.deleteContact()
		}
		alertController.addAction(cancel)
		alertController.addAction(delete)
		DispatchQueue.main.async {
			self.controller?.present(alertController, animated: true)
		}
	}
	
	private func deleteContact() {
		guard let contact = contactDetail?.contact else { return }
		viewModel?.deleteContact(contact)
	}
}
