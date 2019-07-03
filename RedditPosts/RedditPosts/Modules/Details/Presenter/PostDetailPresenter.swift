//
//  PostDetailPresenter.swift
//  RedditPosts
//
//  Created by Olga Matsyk on 7/3/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import Foundation

class PostDetailPresenter {
    
    // MARK: Properties
    
    weak var view: PostDetailView?
    var router: PostDetailWireframe?
    var interactor: PostDetailUseCase?
    var article: Article!
}

extension PostDetailPresenter: PostDetailPresentation {
    
    func viewDidLoad() {
        view?.showDetail(forArticle: article)
    }
    
    // TODO: implement presentation methods
}

extension PostDetailPresenter: PostDetailInteractorOutput {
    // TODO: implement interactor output methods
}

