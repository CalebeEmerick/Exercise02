//
//  EmailSenderTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 27/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class EmailSenderTests: XCTestCase {
	
	private var emailSender: EmailSenderMock!
	
	override func setUp() {
		super.setUp()
		
		emailSender = EmailSenderMock()
	}
	
	override func tearDown() {
		emailSender = nil
		
		super.tearDown()
	}
	
	func test_shouldSend_Email() {
		
		let email = "cemerik@stone.com.br"
		
		emailSender.send(to: email)
		
		expect(self.emailSender.isEmailSent).to(beTrue())
	}
	
	func test_shouldSend_Email_ToRightDestination() {
		
		let email = "cemerik@stone.com.br"
		
		emailSender.send(to: email)
		
		expect(self.emailSender.destination).to(equal(email))
	}
}
