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
	
	private let dataSource = HomeDataSource()
	private let delegate = HomeDelegate()
}

// MARK: - Life Cycle -

extension HomeControllerView {
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		setupTableView()
	}
}

// MARK: - Methods -

extension HomeControllerView {
	
	private func setupTableView() {
		tableView.dataSource = dataSource
		tableView.delegate = delegate
		tableView.register(cellNib: UserCell.self)
	}
}
