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
	
	private let rootView: HomeControllerView
	private let viewModel: HomeViewModel
	
	init(title: String) {
		rootView = HomeControllerView.makeXib()
		viewModel = HomeViewModel()
		
		super.init(nibName: nil, bundle: nil)
		
		self.title = title
		rootView.controller = self
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
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		deselectRowIfNeeded()
	}
}

// MARK: - Life Cycle -

extension HomeController {
	
	private func deselectRowIfNeeded() {
		rootView.deselectRowIfNeeded()
	}
}
