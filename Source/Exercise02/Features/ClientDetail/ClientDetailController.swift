//
//  ClientDetailController.swift
//  Exercise02
//
//  Created by Calebe Emerick on 09/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

// MARK: - Initializers -

final class ClientDetailController: UIViewController {

	private let rootView: ClientDetailControllerView

	init(title: String) {
		rootView = ClientDetailControllerView.makeXib()

		super.init(nibName: nil, bundle: nil)

		self.title = title
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Life Cycle -

extension ClientDetailController {

	override func loadView() {
		view = rootView
	}
}
