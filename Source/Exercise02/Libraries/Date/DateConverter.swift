//
//  DateConverter.swift
//  Exercise02
//
//  Created by Calebe Emerick on 19/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class DateConverter {
	
	private let formatter: DateFormatter
	
	init(formatter: DateFormatter = DateFormatter()) {
		self.formatter = formatter
		formatter.locale = Locale(identifier: "pt_BR")
	}
	
	func toString(date: Date) -> String {
		formatter.dateStyle = .short
		return formatter.string(from: date)
	}
}
