//
//  SearchController.swift
//  InstagranClone
//
//  Created by Taciano Maximo dos Santos on 02/05/22.
//

import UIKit

private let reusaIdentifier = "UserCell"

class SearchController: UITableViewController {
    
    //MARK: - Properties
    private var users = [User]()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchUsers()
    }
    
    //MARK: - API
    
    func fetchUsers() {
        UserService.fetchUsers { users in
            self.users = users
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Helpers
    
    func configureTableView() {
        view.backgroundColor = .white
        
        tableView.register(UserCell.self, forCellReuseIdentifier: reusaIdentifier)
        tableView.rowHeight = 64
        
    }
}

//MARK: - TavleViewDataSource
extension SearchController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusaIdentifier, for: indexPath) as! UserCell
        cell.user = users[indexPath.row]
        return cell
    }
}
