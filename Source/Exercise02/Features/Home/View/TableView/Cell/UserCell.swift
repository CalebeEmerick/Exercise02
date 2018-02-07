//
//  UserCell.swift
//  Exercise02
//
//  Created by Calebe Emerick on 07/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

// MARK: - Initializers -

final class UserCell: UITableViewCell {
	
	@IBOutlet private var containerView: UIView!
	@IBOutlet private var containerNameView: UIView!
	@IBOutlet private var companyName: UILabel!
	@IBOutlet private var companyOwnerName: UILabel!
	
	private let containerInitialsName = CALayer()
	private let initialsName = UILabel()
	
	var model: ClientModel? {
		didSet {
			updateUI()
		}
	}
}

// MARK: - Life Cycle -

extension UserCell {
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		makeContainerNameLayer()
		roundContainerView()
		roundContainerName()
		configInitialsNameLabel()
	}
}

// MARK: - Private Methods -

extension UserCell {
	
	private func updateUI() {
		guard let model = model else { return }
		DispatchQueue.main.async {
			self.companyName.text = model.companyName
			self.companyOwnerName.text = model.companyOwnerName
			self.initialsName.text = model.ownerInitialsName
		}
	}
	
	private func makeContainerNameLayer() {
		let viewFrame = containerNameView.bounds
		containerInitialsName.frame = CGRect(x: 0, y: 0, width: viewFrame.width, height: viewFrame.height)
		containerInitialsName.backgroundColor = UIColor(red: 30 / 255, green: 96 / 255, blue: 160 / 255, alpha: 0.1).cgColor
		containerNameView.layer.addSublayer(containerInitialsName)
	}
	
	private func roundContainerView() {
		containerView.layer.cornerRadius = 4
		containerView.clipsToBounds = true
	}
	
	private func roundContainerName() {
		let halfSize = containerNameView.bounds.width / 2
		containerNameView.layer.cornerRadius = halfSize
		containerNameView.clipsToBounds = true
	}
	
	private func configInitialsNameLabel() {
		let viewFrame = containerNameView.bounds
		initialsName.frame = CGRect(x: 0, y: 0, width: viewFrame.width, height: viewFrame.height)
		initialsName.font = UIFont.systemFont(ofSize: 30, weight: .black)
		initialsName.textColor = UIColor(red: 30 / 255, green: 96 / 255, blue: 160 / 255, alpha: 1)
		initialsName.textAlignment = .center
		initialsName.text = "ABC"
		containerNameView.addSubview(initialsName)
	}
}
