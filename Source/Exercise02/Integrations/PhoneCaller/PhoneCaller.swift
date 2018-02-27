//
//  PhoneCaller.swift
//  Exercise02
//
//  Created by Calebe Emerick on 27/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class PhoneCaller: Caller, IntegrationProtocol {
	
	func call(to phone: String) {
		
		guard !phone.isEmpty else {
			return
		}
		
		let phoneNumber = getOnlyPhoneNumber(from: phone)
		
		guard let phoneUrl = getUrl(from: phoneNumber) else {
			return
		}
		
		guard isUrlValid(phoneUrl) else {
			return
		}
		
		UIApplication.shared.open(phoneUrl)
	}
	
	func getOnlyPhoneNumber(from string: String) -> String {
		return string.flatMap {
			Int(String($0))
			}.map {
				String($0)
			}.joined()
	}
}
