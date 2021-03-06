//
//  HomeDelegate.swift
//  Exercise02
//
//  Created by Calebe Emerick on 07/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class HomeDelegate: NSObject {
	
	var didSelectRow: ((ClientModel) -> Void)?
}

extension HomeDelegate: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		return 110
	}
	
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		
		return UIView()
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		
		return 10
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		guard let cell = tableView.cellForRow(at: indexPath) as? UserCell,
			let model = cell.model else {
			return
		}
		
		didSelectRow?(model)
	}
}
