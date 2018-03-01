//
//  ContactRemovable.swift
//  Exercise02
//
//  Created by Calebe Emerick on 27/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

protocol ContactRemovable {
	
	@discardableResult
	func delete(_ contact: Contact) -> [Contact]
}
