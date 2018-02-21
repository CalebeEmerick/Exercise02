//
//  CompanyNameValidatorTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 21/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class CompanyNameValidatorTests: XCTestCase {
	
	private var validator: CompanyNameValidator!
	
	override func setUp() {
		super.setUp()
		
		validator = CompanyNameValidator()
	}
	
	override func tearDown() {
		validator = nil
		
		super.tearDown()
	}
	
	func test_shouldNotAccept_EmptyString() {
		
		let isEmpty = validator.validate(name: "")
		
		expect(isEmpty).to(beFalse())
	}
	
	func test_shouldNotAccept_MoreCharactersThanAllowed() {
		
		let largeName = validator.validate(name: "Company too large name name name")
		
		expect(largeName).to(beFalse())
	}
	
	func test_shouldNotAccept_LessCharactersThanAllowed() {
		
		let shortName = validator.validate(name: "C")
		
		expect(shortName).to(beFalse())
	}
}
