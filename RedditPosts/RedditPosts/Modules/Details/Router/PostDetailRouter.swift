//
//  PostDetailRouter.swift
//  RedditPosts
//
//  Created by Olga Matsyk on 7/3/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import Foundation
import UIKit

class PostDetailRouter {
    
    static func assembleModule(_ article: Article) -> UIViewController {
        let viewController = PostDetailViewController()
        let presenter = PostDetailPresenter()
        let interactor = PostDetailInteractor()
        
        viewController.presenter =  presenter
        presenter.view = viewController
        presenter.interactor = interactor
        
        presenter.article = article
        
        return viewController
    }
}

