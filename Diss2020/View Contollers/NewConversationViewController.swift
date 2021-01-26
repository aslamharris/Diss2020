//
//  NewConversationViewController.swift
//  Diss2020
//
//  Created by Harris Aslam on 13/07/2020.
//  Copyright © 2020 Harris Aslam. All rights reserved.
//

import UIKit
import JGProgressHUD

class NewConversationViewController: UIViewController {
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for users..."
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.isHidden = true
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let noResultsLabel: UILabel = {
        let label = UILabel()
        label.text = "No Results!"
        label.textAlignment = .center
        label.textColor = .green
        label.font = .systemFont(ofSize: 21, weight: .medium)
        label.isHidden = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(dismissSelf))
        searchBar.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }

}

extension NewConversationViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       
    }
}
