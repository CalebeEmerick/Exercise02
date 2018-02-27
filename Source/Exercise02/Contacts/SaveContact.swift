//
//  SaveContact.swift
//  Exercise02
//
//  Created by Calebe Emerick on 23/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

protocol SaveContact {
	
	func save(_ contact: Contact) -> [Contact]
}
