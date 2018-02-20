//
//  RegistrationController.swift
//  Exercise02
//
//  Created by Calebe Emerick on 07/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

// MARK: - Initializers -

final class RegistrationController: UIViewController {
	
	private let rootView: RegistrationControllerView
	private let viewModel: RegistrationViewModel
	
	init(title: String) {
		rootView = RegistrationControllerView.makeXib()
		viewModel = RegistrationViewModel()
		
		super.init(nibName: nil, bundle: nil)
		
		self.title = title
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Life Cycle -

extension RegistrationController {
	
	override func loadView() {
		view = rootView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		getFieldItems()
		setChangeFocusCallback()
		setCallbackForOpenPicker()
	}
}

// MARK: - Methods -

extension RegistrationController {
	
	private func getFieldItems() {
		let infos = viewModel.getFieldItems()
		rootView.updateFields(with: infos)
	}
	
	private func setChangeFocusCallback() {
		viewModel.didChangeFocusTo = { [weak self] indexPath in
			self?.rootView.changeKeyboardFocus(for: indexPath)
		}
	}
	
	private func setCallbackForOpenPicker() {
		viewModel.didOpenPickerKeyboard = { [weak self] indexPath in
			self?.rootView.openPickerKeyboard(for: indexPath)
		}
	}
}
