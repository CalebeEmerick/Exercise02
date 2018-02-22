//
//  RegistrationDataSource.swift
//  Exercise02
//
//  Created by Calebe Emerick on 07/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class RegistrationDataSource: NSObject {
	
	var items: [RegistrationCellProtocol] = []
	
	weak var viewModel: RegistrationViewModel?
}

extension RegistrationDataSource: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return self.items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell: UITableViewCell
		
		let item = items[indexPath.row]
		
		switch item.type {
		case .field:
			let fieldCell: RegistrationFieldCell = tableView.dequeueReusableCell(for: indexPath)
			fieldCell.viewModel = viewModel
			fieldCell.model = item
			cell = fieldCell
		case .picker:
			let pickerCell: RegistrationPickerCell = tableView.dequeueReusableCell(for: indexPath)
			pickerCell.model = item
			cell = pickerCell
		case .switch:
			let switchCell: RegistrationSwitchCell = tableView.dequeueReusableCell(for: indexPath)
			switchCell.model = item
			cell = switchCell
		}
		
		return cell
	}
}
