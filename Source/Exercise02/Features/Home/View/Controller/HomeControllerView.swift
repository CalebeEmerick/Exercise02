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
	
	func deselectRowIfNeeded() {
		guard let selectedRow = tableView.indexPathForSelectedRow else {
			return
		}
		tableView.deselectRow(at: selectedRow, animated: true)
	}
	
	private func setupTableView() {
		tableView.dataSource = dataSource
		tableView.delegate = delegate
		tableView.register(cellNib: UserCell.self)
	}
	
	private func setupDelegate() {
		delegate.didSelectRow = { [weak self] model in
			self?.openClientDetailScreen()
		}
	}
	
	private func openRegistrationController() {
		let controller = RegistrationController(title: "Novo Cadastro")
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
