//
//  IntegrationProtocol.swift
//  Exercise02
//
//  Created by Calebe Emerick on 27/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

protocol IntegrationProtocol {
	
	func getUrl(for type: String, from string: String) -> URL?
	func isUrlValid(_ url: URL) -> Bool
}

extension IntegrationProtocol {
	
	func getUrl(for type: String, from string: String) -> URL? {
		return URL(string: "\(type)\(string)")
	}
	
	func isUrlValid(_ url: URL) -> Bool {
		return UIApplication.shared.canOpenURL(url)
	}
}
