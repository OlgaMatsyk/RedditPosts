//
//  RedditPostsInteractor.swift
//  RedditPosts
//
//  Created by Olga Matsyk on 7/3/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import RxSwift

class PostsInteractor {
    weak var output: PostsInteractorOutput!
    private var disposeBag = DisposeBag()
}

extension PostsInteractor: PostsUseCase {
    
    func fetchPosts() {
        APIServices.fetchPosts(step: 0)
            .subscribe(onNext: { posts in
                self.output.postsFetched(posts)
            }, onError: { error in
                self.output.failedFetchPosts()
            }).disposed(by: disposeBag)
    }
    
    func fetchMorePosts(_ step: Int)
    {
        APIServices.fetchPosts(step: step)
            .subscribe(onNext: { posts in
                self.output.postsFetched(posts)
            }, onError: { error in
                self.output.failedFetchPosts()
            }).disposed(by: disposeBag)
    }
}

