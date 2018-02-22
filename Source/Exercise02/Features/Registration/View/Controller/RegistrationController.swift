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
	private let nameValidator = NameValidator()
	private let emailValidator = EmailValidator()
	private let phoneValidator = PhoneValidator()
	private let companyNameValidator = CompanyNameValidator()
	private let cnpjValidator = CNPJValidator()
	private let dateValidator = DateValidator()
	
	init(fetcher: RetrieveHeadlines) {
		rootView = RegistrationControllerView.makeXib()
		let validators = ContainerValidator(name: nameValidator,
														email: emailValidator,
														phone: phoneValidator,
														companyName: companyNameValidator,
														cnpj: cnpjValidator,
														date: dateValidator
		)
		viewModel = RegistrationViewModel(fetcher: fetcher, validators: validators)
		
		super.init(nibName: nil, bundle: nil)
		
		rootView.viewModel = viewModel
		self.title = "Novo Cadastro"
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
		let infos = viewModel.getHeadlines()
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
