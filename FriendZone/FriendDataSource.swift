//
//  FriendDataSource.swift
//  FriendZone
//
//  Created by Ashutosh Dave on 06/04/20.
//  Copyright © 2020 Ashutosh Dave. All rights reserved.
//

import UIKit

class FriendDataSource: NSObject, UITableViewDataSource {
	var friends = [Friend]()
	
	override init() {
		let defaults = UserDefaults.standard
		
		guard let savedData = defaults.data(forKey: "Friends") else {
			return
		}
		
		let decoder = JSONDecoder()
		
		guard let savedFriends = try? decoder.decode([Friend].self, from: savedData) else {
			return
		}
		
		friends = savedFriends
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		friends.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		let friend = friends[indexPath.row]
		
		cell.textLabel?.text = friend.name
		
		let dateFormatter = DateFormatter()
		dateFormatter.timeZone = friend.timeZone
		dateFormatter.timeStyle = .short
		
		cell.detailTextLabel?.text = dateFormatter.string(from: Date())
		return cell
	}
}
