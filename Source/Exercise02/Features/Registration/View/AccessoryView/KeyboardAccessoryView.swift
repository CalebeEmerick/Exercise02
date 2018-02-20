//
//  KeyboardAccessoryView.swift
//  Exercise02
//
//  Created by Calebe Emerick on 19/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class KeyboardAccessoryView {
	
	let view: UIView
	var buttonAction: (() -> Void)?
	
	init(button name: String) {
		let doneWidth: CGFloat = 100
		let doneRightPadding: CGFloat = 15
		let barFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
		let doneX = barFrame.width - doneWidth - doneRightPadding
		let doneFrame = CGRect(x: doneX, y: 0, width: doneWidth, height: barFrame.height)
		let bar = UIView(frame: barFrame)
		let done = UIButton(frame: doneFrame)
		let barBackgroundColor = UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1)
		let doneColor = UIColor(red: 55 / 255, green: 55 / 255, blue: 55 / 255, alpha: 1)
		done.setTitle(name, for: .normal)
		done.setTitleColor(doneColor, for: .normal)
		bar.backgroundColor = barBackgroundColor
		bar.addSubview(done)
		view = bar
		done.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
	}
	
	@objc private func didTapButton() {
		buttonAction?()
	}
}
