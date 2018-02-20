//
//  RegistrationDelegate.swift
//  Exercise02
//
//  Created by Calebe Emerick on 07/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class RegistrationDelegate: NSObject {
	
	var items: [RegistrationCellProtocol] = []
}

extension RegistrationDelegate: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		let item = items[indexPath.row]
		
		return item.height
	}
}
