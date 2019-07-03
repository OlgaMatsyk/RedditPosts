//
//  ViewController.swift
//  RedditPosts
//
//  Created by Olga Matsyk on 7/2/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import UIKit

class PostsViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView : UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    var refreshControll = UIRefreshControl()
    var presenter: PostsPresentation!
    var posts: [Article] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
    
    func setupView() {

        
        // set a background color
        tableView.backgroundColor = UIColor.black
        
        // add the table view to self.view
        self.view.addSubview(tableView)
        
        
        // UI constraints
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        // set delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        // register a defalut cell
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.rowHeight = 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
        cell.accessoryType = .disclosureIndicator
        
        cell.postThumbnail.image = UIImage(named: "defaultThumbnail")
        cell.entryDateLabel.text = "entryDateLabel"
        cell.authorLabel.text = "author"
        cell.numberOfCommentsLabel.text = "comments"
        cell.titleLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        
        return cell
    }
}

extension PostsViewController: PostsView {
    
    func showEmptyData() {
        
    }
    
    func showPostData(_ data: [Article]) {
        
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
}
}

