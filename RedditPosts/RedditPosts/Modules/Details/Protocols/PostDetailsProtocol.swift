//
//  PostDetailsProtocol.swift
//  RedditPosts
//
//  Created by Olga Matsyk on 7/3/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import UIKit

protocol PostDetailView: ReusableView {
    // TODO: Declare view methods
    var presenter: PostDetailPresentation! { get set }
    func showDetail(forArticle article: Article)
}

protocol PostDetailPresentation: class {
    // TODO: Declare presentation methods
    var view: PostDetailView? { get set }
    
    func viewDidLoad()
}

protocol PostDetailUseCase: class {
    // TODO: Declare use case methods
}

protocol PostDetailInteractorOutput: class {
    // TODO: Declare interactor output methods
}

protocol PostDetailWireframe: class {
    // TODO: Declare wireframe methods
    static func assembleModule(_ article: Article) -> UIViewController
}

protocol ReusableView: class {}

