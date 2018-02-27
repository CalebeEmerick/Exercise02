//
//  ContactDetailDataSource.swift
//  Exercise02
//
//  Created by Calebe Emerick on 26/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class ContactDetailDataSource: NSObject {
	
	var items: [ContactDetailCellModel] = []
}

extension ContactDetailDataSource: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell: ContactDetailCell = tableView.dequeueReusableCell(for: indexPath)
		
		let item = items[indexPath.row]
		
		cell.model = item
		
		return cell
	}
}
