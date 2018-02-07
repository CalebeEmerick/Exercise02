//
//  AppDelegate.swift
//  Exercise02
//
//  Created by Calebe Emerick on 07/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		let frame = UIScreen.main.bounds
		let window = UIWindow(frame: frame)
		
		self.window = window
		
		let rootController = HomeController(title: "Clientes")
		let navigationController = UINavigationController(rootViewController: rootController)
		
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
		
		return true
	}
}
