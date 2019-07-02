//
//  ViewController.swift
//  RedditPosts
//
//  Created by Olga Matsyk on 7/2/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import UIKit

class ViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView : UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

class PostTableViewCell: UITableViewCell {
    
    var titleLabel = UILabel()
    var authorLabel = UILabel()
    var entryDateLabel = UILabel()
    var numberOfCommentsLabel = UILabel()
    var unreadStatus = UIImageView()
    var postThumbnail = UIImageView()
    var dismissPostButton = UIButton(type: .roundedRect)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        unreadStatus.translatesAutoresizingMaskIntoConstraints = false
        postThumbnail.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        entryDateLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfCommentsLabel.translatesAutoresizingMaskIntoConstraints = false
        dismissPostButton.translatesAutoresizingMaskIntoConstraints = false
        
        unreadStatus.image = UIImage(named: "unread")
        
        postThumbnail.contentMode = .scaleAspectFit
        
        dismissPostButton.setTitle("Dismiss Post", for: .normal)
        dismissPostButton.setTitleColor(.white, for: .normal)

        entryDateLabel.textColor = UIColor.gray
        authorLabel.textColor = UIColor.white
        
        numberOfCommentsLabel.textColor = UIColor.orange
        
        titleLabel.textColor = UIColor.white
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = UIFont(name: "Heiti TC", size: 40)
        titleLabel.numberOfLines = 0
        titleLabel.minimumScaleFactor = 0.1
        titleLabel.baselineAdjustment = .alignCenters
        titleLabel.textAlignment  = .center
        titleLabel.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)

        self.contentView.addSubview(unreadStatus)
        self.contentView.addSubview(postThumbnail)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(authorLabel)
        self.contentView.addSubview(entryDateLabel)
        self.contentView.addSubview(dismissPostButton)
        self.contentView.addSubview(numberOfCommentsLabel)
        self.backgroundColor = UIColor.black
        
        let viewsDict = [
            "title" : titleLabel,
            "author" : authorLabel,
            "status" : unreadStatus,
            "thumbnail" : postThumbnail,
            "date" : entryDateLabel,
            "comments" : numberOfCommentsLabel,
            "dismiss" : dismissPostButton
        ]
        
        var allConstraints: [NSLayoutConstraint] = []
        
        let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-12-[status(20)]-[author]-[date]-|",
            metrics: nil,
            views: viewsDict)
        allConstraints += topRowHorizontalConstraints
        
        let imagesVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-12-[status(20)]-[thumbnail(100)]",
            metrics: nil,
            views: viewsDict)
        allConstraints += imagesVerticalConstraints
        
        let titleLabelLabelVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[status]-[title(100)]",
            metrics: nil,
            views: viewsDict)
        allConstraints += titleLabelLabelVerticalConstraints
        
        let dateVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-10-[date]",
            metrics: nil,
            views: viewsDict)
        allConstraints += dateVerticalConstraints
        
        let authorVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-10-[author]",
            metrics: nil,
            views: viewsDict)
        allConstraints += authorVerticalConstraints
        
        let middleRowHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-[thumbnail(100)]-[title]-|",
            metrics: nil,
            views: viewsDict)
        allConstraints += middleRowHorizontalConstraints
        
        let dismissVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[dismiss(20)]-|",
            metrics: nil,
            views: viewsDict)
        allConstraints += dismissVerticalConstraints
        
        let dismissHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-[dismiss(100)]",
            metrics: nil,
            views: viewsDict)
        allConstraints += dismissHorizontalConstraints
        
        let commentsVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[comments]-|",
            metrics: nil,
            views: viewsDict)
        allConstraints += commentsVerticalConstraints
        
        let bottomRowHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:[comments]-|",
            metrics: nil,
            views: viewsDict)
        allConstraints += bottomRowHorizontalConstraints
        
        // activate constraints
        NSLayoutConstraint.activate(allConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("dismiss post button tapped")
    }
}
