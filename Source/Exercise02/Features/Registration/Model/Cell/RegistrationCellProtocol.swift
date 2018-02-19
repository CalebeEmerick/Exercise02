//
//  RegistrationCellProtocol.swift
//  Exercise02
//
//  Created by Calebe Emerick on 19/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

protocol RegistrationCellProtocol {
	
	var type: RegistrationCellType { get }
	
	var height: CGFloat { get }
}
