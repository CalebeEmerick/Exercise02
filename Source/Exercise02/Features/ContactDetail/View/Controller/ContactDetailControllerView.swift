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
		
	}
	
	private let dataSource = ContactDetailDataSource()
	private let delegate = ContactDetailDelegate()
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
	
	private func setupTableView() {
		tableView.dataSource = dataSource
		tableView.delegate = delegate
		tableView.register(cellNib: ContactDetailCell.self)
	}
}
