//
//  EmailSenderMock.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 27/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Foundation

final class EmailSenderMock: EmailSend {
	
	var isEmailSent = false
	var destination = ""
	
	func send(to email: String) {
		isEmailSent = true
		destination = email
	}
}
