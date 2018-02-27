//
//  EmailSender.swift
//  Exercise02
//
//  Created by Calebe Emerick on 27/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class EmailSender: EmailSend, IntegrationProtocol {
	
	func send(to email: String) {
		
		guard !email.isEmpty else {
			return
		}
		
		guard let emailUrl = getUrl(from: email) else {
			return
		}
		
		guard isUrlValid(emailUrl) else {
			return
		}
		
		UIApplication.shared.open(emailUrl)
	}
}
