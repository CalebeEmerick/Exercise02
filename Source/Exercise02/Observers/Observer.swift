//
//  Observer.swift
//  Exercise02
//
//  Created by Calebe Emerick on 19/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

enum Observer {
	
	enum Registration {
		
		static let kPressedKeyboardButton = name("PressedKeyboardButton")
	}
}

extension Observer {
	
	private static func name(_ string: String) -> Notification.Name {
		return Notification.Name(string)
	}
}
