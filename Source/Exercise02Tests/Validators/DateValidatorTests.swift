//
//  DateValidatorTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 21/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class DateValidatorTests: XCTestCase {
	
	private var validator: DateValidator!
	
	override func setUp() {
		super.setUp()
		
		validator = DateValidator()
	}
	
	override func tearDown() {
		validator = nil
		
		super.tearDown()
	}
	
	func test_shouldNotAccept_EmptyString() {
		
		let isEmpty = validator.validate(date: "")
		
		expect(isEmpty).to(beFalse())
	}
	
	func test_shouldNotAccept_OnlyNumbers() {
		
		let onlyNumbers = validator.validate(date: "10102010")
		
		expect(onlyNumbers).to(beFalse())
	}
	
	func test_shouldNotAccept_InvalidFormat() {
		
		let invalidFormat = validator.validate(date: "10-10-2010")
		
		expect(invalidFormat).to(beFalse())
	}
	
	func test_shouldNotAccept_InvalidDate() {
		
		let invalidDate = validator.validate(date: "29/02/2005")
		
		expect(invalidDate).to(beFalse())
	}
	
	func test_shouldAccept_ValidDate() {
		
		let validDate = validator.validate(date: "29/02/2004")
		
		expect(validDate).to(beTrue())
	}
}
