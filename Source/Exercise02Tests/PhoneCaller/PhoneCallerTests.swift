//
//  PhoneCallerTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 27/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class PhoneCallerTests: XCTestCase {
	
	private var caller: PhoneCallerMock!
	
	override func setUp() {
		super.setUp()
		
		caller = PhoneCallerMock()
	}
	
	override func tearDown() {
		caller = nil
		
		super.tearDown()
	}
	
	func test_shouldCall_PhoneNumber() {
		
		let phone = "(21) 97169 7123"
		
		caller.call(to: phone)
		
		expect(self.caller.isPhoneCalled).to(beTrue())
	}
}
