//
//  MainCoordinator.swift
//  FriendZone
//
//  Created by Ashutosh Dave on 29/03/20.
//  Copyright © 2020 Ashutosh Dave. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
	var childCoordinators = [Coordinator]()
	
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	func start() {
		let vc = ViewController.instantiate()
		navigationController.pushViewController(vc, animated: false)
	}
	
	
}
