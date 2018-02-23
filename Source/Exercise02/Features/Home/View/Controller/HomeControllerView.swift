//
//  HomeControllerView.swift
//  Exercise02
//
//  Created by Calebe Emerick on 07/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

// MARK: - Initializers -

final class HomeControllerView: UIView {
	
	@IBOutlet private var tableView: UITableView!
	@IBAction private func didTapAddButton() {
		openRegistrationController()
	}
	
	private let dataSource = HomeDataSource()
	private let delegate = HomeDelegate()
	private var emptyState: HomeEmptyState?
	
	var homeViewModel: HomeViewModel?
	weak var controller: HomeController?
}

// MARK: - Life Cycle -

extension HomeControllerView {
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		setupTableView()
		setupDelegate()
	}
}

// MARK: - Methods -

extension HomeControllerView {
	
	func showEmptyState() {
		let view = HomeEmptyState.makeXib()
		emptyState = view
		DispatchQueue.main.async {
			self.addSubview(view)
			view.translatesAutoresizingMaskIntoConstraints = false
			view.centerYAnchor.constraint(equalTo: self.centerYAnchor)
				.isActive = true
			view.centerXAnchor.constraint(equalTo: self.centerXAnchor)
				.isActive = true
		}
	}
	
	func setDataSource(with contacts: [ClientModel]) {
		dataSource.items = contacts
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
  
	func deselectRowIfNeeded() {
		guard let selectedRow = tableView.indexPathForSelectedRow else { return }
		tableView.deselectRow(at: selectedRow, animated: true)
	}
	
	private func setupTableView() {
		tableView.dataSource = dataSource
		tableView.delegate = delegate
		tableView.register(cellNib: UserCell.self)
	}
	
	private func setupDelegate() {
		delegate.didSelectRow = { [weak self] _ in
			self?.openClientDetailScreen()
		}
	}
	
	private func openRegistrationController() {
		let fetcher = InMemoryHeadlines()
		let controller = RegistrationController(fetcher: fetcher)
		DispatchQueue.main.async {
			self.controller?.show(controller, sender: nil)
		}
	}
	
	private func openClientDetailScreen() {
		let controller = ClientDetailController(title: "Detalhes do Cliente")
		DispatchQueue.main.async {
			self.controller?.show(controller, sender: nil)
		}
	}
}
