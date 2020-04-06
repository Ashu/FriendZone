//
//  ViewController.swift
//  FriendZone
//
//  Created by Ashutosh Dave on 28/03/20.
//  Copyright © 2020 Ashutosh Dave. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, Storyboarded {
	weak var coordinator: MainCoordinator?
	var dataSource = FriendDataSource()
	var selectedFriend: Int? = nil
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		tableView.dataSource = dataSource
		
		title = "Friend Zone"
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFriend))
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		selectedFriend = indexPath.row
		
		coordinator?.configure(friend: dataSource.friends[indexPath.row])
	}
	
	func saveData() {
		let defaults = UserDefaults.standard
		let encoder = JSONEncoder()
		
		guard let savedData = try? encoder.encode(dataSource.friends) else {
			fatalError("Unable to encode friends data.")
		}
		
		defaults.set(savedData, forKey: "Friends")
	}
	
	@objc func addFriend() {
		let friend = Friend()
		dataSource.friends.append(friend)
		tableView.insertRows(at: [IndexPath(row: dataSource.friends.count - 1, section: 0)], with: .automatic)
		saveData()
		
		selectedFriend = dataSource.friends.count - 1
		coordinator?.configure(friend: friend)
	}
	
	func update(friend: Friend) {
		guard let selectedFriend = selectedFriend else { return }
		
		dataSource.friends[selectedFriend] = friend
		tableView.reloadData()
		saveData()
	}
}

