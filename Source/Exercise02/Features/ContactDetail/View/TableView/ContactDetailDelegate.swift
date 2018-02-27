//
//  ContactDetailDelegate.swift
//  Exercise02
//
//  Created by Calebe Emerick on 26/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class ContactDetailDelegate: NSObject {
	
	
}

extension ContactDetailDelegate : UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		return 70
	}
}
