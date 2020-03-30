//
//  Storyboarded.swift
//  FriendZone
//
//  Created by Ashutosh Dave on 29/03/20.
//  Copyright © 2020 Ashutosh Dave. All rights reserved.
//

import UIKit

protocol Storyboarded {
	static func instantiate() -> Self
}


extension Storyboarded where Self: UIViewController {
	static func instantiate() -> Self {
		let className = String(describing: self)
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		
		return storyboard.instantiateViewController(withIdentifier: className) as! Self
	}
}
