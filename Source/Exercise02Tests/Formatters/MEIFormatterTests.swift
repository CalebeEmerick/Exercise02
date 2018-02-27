//
//  MEIFormatterTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 27/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class MEIFormatterTests: XCTestCase {
	
	private var formatter: MEIFormatter!
	
	override func setUp() {
		super.setUp()
		
		formatter = MEIFormatter()
	}
	
	override func tearDown() {
		formatter = nil
		
		super.tearDown()
	}
	
	func test_sholdReturn_NoMessage_When_MEIIsFalse() {
		
		let isMei = false
		
		let isMeiFormatted = formatter.format(isMei)
		
		expect(isMeiFormatted).to(equal("Não"))
	}
	
	func test_sholdReturn_YesMessage_When_MEIIsTrue() {
		
		let isMei = true
		
		let isMeiFormatted = formatter.format(isMei)
		
		expect(isMeiFormatted).to(equal("Sim"))
	}
}
