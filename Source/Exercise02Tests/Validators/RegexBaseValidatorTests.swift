//
//  RegexBaseValidatorTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 20/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class RegexBaseValidatorTests: XCTestCase {
	
	private var validator: RegexBaseValidator!
	
	override func setUp() {
		super.setUp()
		
		validator = RegexBaseValidator()
	}
	
	override func tearDown() {
		validator = nil
		
		super.tearDown()
	}
	
	func test_shouldOnlyAccept_FiveNumbers() {
		
		let pattern = "^[0-9]{5}$"
		
		let validation = validator.validate("1234", with: pattern)
		
		expect(validation).to(beFalse())
	}
	
	func test_shouldNotAccept_CapitalLetters() {
		
		let pattern = "^[a-z]*$"
		
		let validation = validator.validate("Test", with: pattern)
		
		expect(validation).to(beFalse())
	}
}
