//
//  RegistrationCellDateCapture.swift
//  Exercise02
//
//  Created by Calebe Emerick on 22/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

protocol RegistrationCellDateCapture: class {
	
	func validate(_ text: String) -> CGColor
}
