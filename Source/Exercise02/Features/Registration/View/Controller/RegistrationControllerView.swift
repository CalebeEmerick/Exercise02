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
	
	@IBOutlet private var tableView: UITableView!
	
	private let dataSource = RegistrationDataSource()
	private let delegate = RegistrationDelegate()
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
	
	private func setupTableView() {
		tableView.dataSource = dataSource
		tableView.delegate = delegate
		
	}
}
