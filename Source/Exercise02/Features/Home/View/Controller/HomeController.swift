//
//  HomeController.swift
//  Exercise02
//
//  Created by Calebe Emerick on 07/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

// MARK: - Initializers -

final class HomeController: UIViewController {
	
	private let fetcher: RetrieveContacts
	private let rootView: HomeControllerView
	private let viewModel: HomeViewModel
	
	init(fetcher: RetrieveContacts) {
		self.fetcher = fetcher
		rootView = HomeControllerView.makeXib()
		viewModel = HomeViewModel(fetcher: fetcher)
		
		super.init(nibName: nil, bundle: nil)
		
		title = "Clientes"
		rootView.controller = self
		rootView.homeViewModel = viewModel
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Life Cycle -

extension HomeController {
	
	override func loadView() {
		view = rootView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setRetrieveContactsCallback()
		setContactListChangeCallback()
		viewModel.fetchClients()
	}
  
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		deselectRowIfNeeded()
	}
}

// MARK: - Methods -

extension HomeController {
	
	private func setRetrieveContactsCallback() {
		viewModel.didFetchContacts = { [weak self] contacts in
			self?.showList(with: contacts)
		}
		viewModel.didFetchEmptyContacts = { [weak self] in
			self?.showEmptyState()
		}
	}
	
	private func showList(with contacts: [ClientModel]) {
		rootView.setDataSource(with: contacts)
		rootView.reloadAllData()
	}
	
	private func showEmptyState() {
		rootView.showEmptyState()
	}
  
	private func deselectRowIfNeeded() {
		rootView.deselectRowIfNeeded()
	}
	
	private func setContactListChangeCallback() {
		viewModel.didUpdateContacts = { [weak self] contacts in
			self?.rootView.hideEmptyViewIfNeeded()
			self?.rootView.setDataSource(with: contacts)
			self?.rootView.reloadSection()
		}
	}
}
