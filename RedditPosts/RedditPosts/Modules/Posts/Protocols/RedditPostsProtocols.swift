//
//  RedditPostProtocols.swift
//  RedditPosts
//
//  Created by Olga Matsyk on 7/3/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import UIKit

protocol PostsView: IndicateTableView {
    // TODO: Declare view methods
    
    var presenter: PostsPresentation! { get set }
    func showEmptyData()
    func showPostsData(_ data: [Article])
}

protocol PostsPresentation: class {
    // TODO: Declare presentation methods
    var view: PostsView? { get set }
    var interactor: PostsUseCase! { get set }
    var router: PostsWireframe! { get set }
    
    func viewDidLoad()
    func viewNeedsMoreItems()
    func didSelectedPost(_ post: Article)
    func didReloadFetchPosts()
}

protocol PostsUseCase: class {
    // TODO: Declare interactor methods
    var output: PostsInteractorOutput! { get set }
    
    func fetchPosts()
    
    func fetchMorePosts(_ step: Int)
}

protocol PostsInteractorOutput: class {
    // TODO: Declare interactor output methods
    func postsFetched(_ posts: Posts)
    func failedFetchPosts()
}

protocol PostsWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    
    func openPostDetail(withPost post: Article)
    
    static func assembleModule() -> UIViewController
}

protocol IndicateTableView: class {
    func showLoading()
    func hideLoading()
}

