//
//  RegistrationControllerView.swift
//  Exercise02
//
//  Created by Calebe Emerick on 07/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

// MARK: - Initializers -

final class RegistrationControllerView: UIView {
	
	@IBOutlet private var registerButton: UIButton!
	@IBOutlet private var tableView: UITableView!
	
	@IBAction private func registerAction() {
		
	}
	
	var viewModel: RegistrationViewModel? {
		didSet {
			dataSource.viewModel = viewModel
		}
	}
	
	private let delegate = RegistrationDelegate()
	private let dataSource = RegistrationDataSource()
	private var items: [RegistrationCellProtocol] = []
}

// MARK: - Life Cycle -

extension RegistrationControllerView {
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		setupTableView()
	}
}

// MARK: - Methods -

extension RegistrationControllerView {
	
	func updateFields(with items: [RegistrationCellProtocol]) {
		self.items = items
		dataSource.items = items
		delegate.items = items
	}
	
	func changeKeyboardFocus(for indexPath: IndexPath) {
		if let cell = tableView.cellForRow(at: indexPath) as? RegistrationFieldCell {
			cell.setTextFieldFocus()
		}
	}
	
	func openPickerKeyboard(for indexPath: IndexPath) {
		if let cell = tableView.cellForRow(at: indexPath) as? RegistrationPickerCell {
			cell.openPickerKeyboard()
		}
	}
	
	func setButton(to isEnabled: Bool) {
		DispatchQueue.main.async {
			self.registerButton.isEnabled = isEnabled
		}
	}
	
	private func setupTableView() {
		setTopSpace()
		setBottomSpace()
		registerCells()
		setDelegate()
		setDataSource()
	}
	
	private func registerCells() {
		tableView.register(cellNib: RegistrationFieldCell.self)
		tableView.register(cellNib: RegistrationPickerCell.self)
		tableView.register(cellNib: RegistrationSwitchCell.self)
	}
	
	private func setDelegate() {
		tableView.delegate = delegate
	}
	
	private func setDataSource() {
		tableView.dataSource = dataSource
	}
	
	private func setTopSpace() {
		let view = makeSpaceView()
		tableView.tableHeaderView = view
	}
	
	private func setBottomSpace() {
		let view = makeSpaceView()
		tableView.tableFooterView = view
	}
	
	private func makeSpaceView() -> UIView {
		let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20)
		let view = UIView(frame: frame)
		return view
	}
}
