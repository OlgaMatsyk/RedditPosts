//
//  ViewController.swift
//  RedditPosts
//
//  Created by Olga Matsyk on 7/2/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import UIKit
import Kingfisher

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
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
        cell.accessoryType = .disclosureIndicator
        
        let article = self.posts[indexPath.row]
        
        cell.authorLabel.text = article.author
        cell.titleLabel.text = article.title
        
        let date = Date(timeIntervalSince1970: article.created ?? 0)
        cell.entryDateLabel.text = date.getElapsedInterval()
        cell.numberOfCommentsLabel.text = String(format:"Comments %d", article.num_comments ?? 0)
        
        cell.postThumbnail.kf.setImage(
                with: URL(string: article.thumbnail ?? "")
        )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectedPost(self.posts[indexPath.row])
    }
}

    extension PostsViewController: PostsView {
        
        func showEmptyData() {
            // TODO: show no results placeholder
        }
        
        func showPostData(_ data: [Article]) {
            self.posts = data
        }
}

extension Date {
    
    func getElapsedInterval() -> String {
        
        let interval = Calendar.current.dateComponents([.year, .month, .day], from: self, to: Date())
        
        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + " " + "year ago" :
                "\(year)" + " " + "years ago"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " " + "month ago" :
                "\(month)" + " " + "months ago"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + " " + "day ago" :
                "\(day)" + " " + "days ago"
        } else {
            return "a moment ago"
            
        }
    }
}

