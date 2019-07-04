//
//  APIServices.swift
//  RedditPosts
//
//  Created by Olga Matsyk on 7/3/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class APIServices {
    
    ///
    /// - Returns: return
    static func fetchPosts(step: Int) -> Observable<Posts> {
        
        return Observable<Posts>.create({ observer -> Disposable in
            
            let urlStr : String = String(format: API.moreItemsUrl, step)

            let urlStrEncoded : String = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

            let url = URL(string: urlStrEncoded)
            let request = Alamofire
                .request(url!, method: .get)
                .validate()
                .responseString(completionHandler: { response in
                    switch response.result {
                    case .success:
                        guard let getData = response.data else {
                            return
                        }
                        
                        do {
                            
                            let jsonDict = try JSONSerialization.jsonObject(with: getData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                            let data = jsonDict!["data"] as? NSDictionary
                            let postsArray = data!["children"] as? [NSDictionary]
                            
                            var atricles = [Article]()
                            
                            for dict in postsArray! {
                                let postData = dict["data"] as? NSDictionary

                                // Condition required to check for type safety :)
                                guard let author = postData!["author"] as? String,
                                    let title = postData!["title"] as? String,
                                    let comments = postData!["num_comments"] as? Int,
                                    let created = postData!["created"] as? Double,
                                    let thumbnail = postData!["thumbnail"] as? String else {
                                        print("Something is not well")
                                        continue
                                }
                                
                                let object = Article(author: author, title: title, thumbnail: thumbnail, created: created, num_comments: comments, unreadStatus: false)
                                atricles.append(object)
                            }
                         
                            let posts = Posts(status: "", articles: atricles)
                            // TODO change deserialization to JSONDecoder
//                            let decoded = try JSONDecoder().decode(Posts.self, from: postsData!)
                            observer.onNext(posts)
                            observer.onCompleted()
                        } catch (let error) {
                            observer.onError(error)
                        }
                        
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
                })
            return Disposables.create(with: {
                request.cancel()
            })
            
        })
    }
}
