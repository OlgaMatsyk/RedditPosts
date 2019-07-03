//
//  PostsRouter.swift
//  RedditPosts
//
//  Created by Olga Matsyk on 7/3/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import Foundation
import UIKit

class PostsRouter {
    
    // MARK: Properties
    
    weak var viewController: UIViewController?
    
    // MARK: Static methods
}

extension PostsRouter: PostsWireframe {
    
    func openPostDetail(withPost post: Article) {
        
    }
    
    static func assembleModule() -> UIViewController {
        let view =  PostsViewController()
        let presenter = PostsPresenter()
        let router = PostsRouter()
        let interactor = PostsInteractor()
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter =  presenter
        
        presenter.view = view as PostsView
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return navigation
    }
    
    // TODO: Implement wireframe methods
}

