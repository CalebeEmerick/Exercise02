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
	
	weak var controller: HomeController?
	
	weak var homeViewModel: HomeViewModel?
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
	
	func setDataSource(with contacts: [ClientModel]) {
		dataSource.items = contacts
	}
	
	func deselectRowIfNeeded() {
		guard let selectedRow = tableView.indexPathForSelectedRow else { return }
		tableView.deselectRow(at: selectedRow, animated: true)
	}
	
	func reloadAllData() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
	
	func reloadSection() {
		let section = IndexSet(0...0)
		DispatchQueue.main.async {
			self.tableView.reloadSections(section, with: .automatic)
		}
	}
	
	func hideEmptyViewIfNeeded() {
		guard let emptyView = emptyState else { return }
		UIView.animate(withDuration: 0.3, animations: {
			emptyView.alpha = 0
		}) { _ in
			emptyView.removeFromSuperview()
		}
	}
	
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
		let saver = ContactSaver()
		let controller = RegistrationController(fetcher: fetcher, saver: saver)
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
