//
//  PostDetailsViewController.swift
//  RedditPosts
//
//  Created by Olga Matsyk on 7/3/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class PostDetailViewController: UIViewController {
    
    var titleLabel = UILabel()
    var authorLabel = UILabel()
    var postThumbnail = UIImageView()
    
    // MARK: Properties
    
    var presenter: PostDetailPresentation!
    var article: Article!
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        presenter.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if #available(iOS 11, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = false
        }
        self.navigationItem.title = "Post"
        
    }
    
    func setupView() {
        
        self.view.addSubview(postThumbnail)
        self.view.addSubview(titleLabel)
        self.view.addSubview(authorLabel)
        self.view.backgroundColor = UIColor.gray
        
        postThumbnail.translatesAutoresizingMaskIntoConstraints = false

        postThumbnail.contentMode = .scaleAspectFit
        
        let viewsDict = [
            "title" : titleLabel,
            "author" : authorLabel,
            "thumbnail" : postThumbnail,
        ]
        
        var allConstraints: [NSLayoutConstraint] = []
        
        let thumbnailHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-[thumbnail]-|",
            metrics: nil,
            views: viewsDict)
        allConstraints += thumbnailHorizontalConstraints
        
        let thumbnailVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[thumbnail]-|",
            metrics: nil,
            views: viewsDict)
        allConstraints += thumbnailVerticalConstraints
        
        // activate constraints
        NSLayoutConstraint.activate(allConstraints)
    }
}

extension PostDetailViewController: PostDetailView {
    
    func showDetail(forArticle article: Article) {
        self.navigationItem.title = article.title
        self.article = article
        
        self.postThumbnail.kf.setImage(
            with: URL(string: article.thumbnail ?? "")
        )
    }
    
}





