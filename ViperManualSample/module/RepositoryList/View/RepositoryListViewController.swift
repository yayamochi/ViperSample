//
//  RepositoryListViewController.swift
//  ViperManualSample
//
//  Created by Yaya Watanabe on 2020/07/11.
//  Copyright © 2020 Yaya Watanabe. All rights reserved.
//

import UIKit


protocol RepositoryListView: AnyObject {
    func updateRepositories(repositories: [Repository])
}


class RepositoryListViewController: UIViewController {
    var presenter: RepositoryListViewPresentation!

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RepositoryTableViewCell", bundle: nil), forCellReuseIdentifier: "repositoryCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        presenter?.fetchTrendingRepositories()
    
    }
    
    
    private var repositories: [Repository] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
}


extension RepositoryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RepositoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "repositoryCell") as? RepositoryTableViewCell else {
            fatalError("can't create cell")
        }
        cell.setRepository(repositories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select")
    }
}

extension RepositoryListViewController: RepositoryListView {
    func updateRepositories(repositories: [Repository]) {
        self.repositories = repositories
    }
}
