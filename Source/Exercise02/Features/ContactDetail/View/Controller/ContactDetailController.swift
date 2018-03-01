//
//  ContactDetailController.swift
//  Exercise02
//
//  Created by Calebe Emerick on 09/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

// MARK: - Initializers -

final class ContactDetailController: UIViewController {
	
	private let contactRemover: ContactRemovable
	private let emailSender: EmailSend
	private let phoneCaller: Caller
	private let contactDetail: ContactDetail
	private let phoneFormatter: PhoneFormatter
	private let cnpjFormatter: CNPJFormatter
	private let meiFormatter: MEIFormatter
	private let viewModel: ContactDetailViewModel
	private let rootView: ContactDetailControllerView

	init(detail: ContactDetail) {
		contactDetail = detail
		phoneFormatter = PhoneFormatter()
		cnpjFormatter = CNPJFormatter()
		meiFormatter = MEIFormatter()
		phoneCaller = PhoneCaller()
		emailSender = EmailSender()
		contactRemover = ContactRemover()
		
		rootView = ContactDetailControllerView.makeXib()
		
		viewModel = ContactDetailViewModel(phoneFormatter: phoneFormatter,
													  cnpjFormatter: cnpjFormatter,
													  meiFormatter: meiFormatter,
													  phoneCaller: phoneCaller,
													  emailSender: emailSender,
													  contactRemover: contactRemover)
		
		super.init(nibName: nil, bundle: nil)

		title = detail.title
		rootView.controller = self
		rootView.contactDetail = contactDetail
		rootView.viewModel = viewModel
	}
  
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Life Cycle -

extension ContactDetailController {
  
	override func loadView() {
		view = rootView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setDeselectCellCallback()
		setCloseScreenCallback()
		
		let details = viewModel.getContactDetail(contactDetail.contact)
		loadContact(with: details)
	}
}

// MARK: - Methods -

extension ContactDetailController {
	
	private func loadContact(with details: [ContactDetailCellModel]) {
		rootView.updateList(with: details)
		rootView.reloadList()
	}
	
	private func setDeselectCellCallback() {
		viewModel.didDeselectCell = { [weak self] indexPath in
			self?.rootView.deselectRow(for: indexPath)
		}
	}
	
	private func setCloseScreenCallback() {
		viewModel.didCloseScreen = { [weak self] in
			self?.rootView.closeScreen()
		}
	}
}
