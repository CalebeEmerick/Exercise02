//
//  ContactDetailDelegate.swift
//  Exercise02
//
//  Created by Calebe Emerick on 26/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class ContactDetailDelegate: NSObject {
	
	weak var viewModel: ContactDetailViewModel?
}

extension ContactDetailDelegate : UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		guard let cell = tableView.cellForRow(at: indexPath) as? ContactDetailCell,
			let model = cell.model else {
				return
		}
		
		viewModel?.executeActionForCellTap(with: model, for: indexPath)
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		return 70
	}
	
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		
		return UIView()
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		
		return 0.1
	}
}
