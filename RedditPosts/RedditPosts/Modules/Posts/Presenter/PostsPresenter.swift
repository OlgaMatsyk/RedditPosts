//
//  PostsPresenter.swift
//  RedditPosts
//
//  Created by Olga Matsyk on 7/3/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import Foundation

class PostsPresenter {
    
    // MARK: Properties
    
    weak var view: PostsView?
    var router: PostsWireframe!
    var interactor: PostsUseCase!
    var step: Int = 10
    
    var posts: Posts? {
        didSet {
            guard let postsArticles = posts?.articles else { return }
            if postsArticles.count > 0 {
                view?.showPostsData(postsArticles)
            } else {
                view?.showEmptyData()
            }
        }
    }
}

extension PostsPresenter: PostsPresentation {
    
    func didSelectedPost(_ post: Article) {
        router.openPostDetail(withPost: post)
    }
    
    func didReloadFetchPosts() {
        interactor.fetchPosts()
        view?.showLoading()
    }
    
    
    func viewDidLoad() {
        interactor.fetchPosts()
        view?.showLoading()
    }
    
    func viewNeedsMoreItems() {
        interactor.fetchMorePosts(step)
        view?.showLoading()
        step = step + 10
    }
}

extension PostsPresenter: PostsInteractorOutput {
    func postsFetched(_ posts: Posts) {
        self.posts = posts
        view?.hideLoading()
    }
    
    
    func failedFetchPosts() {
        view?.showEmptyData()
        view?.hideLoading()
    }
    
    // TODO: implement interactor output methods
}
