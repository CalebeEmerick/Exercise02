//
//  RetrieveHeadlines.swift
//  Exercise02
//
//  Created by Calebe Emerick on 21/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

protocol RetrieveHeadlines {
	
	func fetch() -> [RegistrationCellProtocol]
}
