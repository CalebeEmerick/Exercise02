//
//  EmailValidatorTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 20/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

class EmailValidatorTests: XCTestCase {
	
	private var validator: EmailValidator!
	
	override func setUp() {
		super.setUp()
		
		validator = EmailValidator()
	}
	
	override func tearDown() {
		validator = nil
		
		super.tearDown()
	}
	
	func test_shouldNotAccept_EmptyString() {
		
		let isEmpty = validator.validate(email: "")
		
		expect(isEmpty).to(beFalse())
	}
	
	func test_shouldNotAccept_Email_WithoutDomain() {
		
		let noDomainEmail = validator.validate(email: "email@.com")
		
		expect(noDomainEmail).to(beFalse())
	}
	
	func test_shouldNotAccept_Email_WithoutFirstPart() {
		
		let invalidEmail = validator.validate(email: "@example.com")
		
		expect(invalidEmail).to(beFalse())
	}
	
	func test_shouldNotAccept_Email_WithoutTheFinalPart() {
		
		let invalidEmail = validator.validate(email: "test@example")
		
		expect(invalidEmail).to(beFalse())
	}
	
	func test_shouldAccept_SpecialCharacters() {
		
		let validEmail = validator.validate(email: "t$%e!s.t@example.com")
		
		expect(validEmail).to(beTrue())
	}
	
	func test_shouldAcceptValid_Email() {
		
		let validEmail = validator.validate(email: "test@example.com")
		
		expect(validEmail).to(beTrue())
	}
}
