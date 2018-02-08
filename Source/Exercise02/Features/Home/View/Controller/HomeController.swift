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
	
	private let homeView: HomeControllerView
	
	init(title: String) {
		homeView = HomeControllerView.makeXib()
		
		super.init(nibName: nil, bundle: nil)
		
		self.title = title
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Life Cycle -

extension HomeController {
	
	override func loadView() {
		view = homeView
	}
}
