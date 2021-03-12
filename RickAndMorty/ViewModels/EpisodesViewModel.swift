//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Malavika Akhilesh on 11/03/21.
//  Copyright © 2021 Malavika Akhilesh. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class EpisodesViewModel: NSObject {
    let disposeBag = DisposeBag()
    
    private var episodes: [Episode] = []
    private var nextURL:String?
    
    func getURLString() -> String {
        guard let next = nextURL else {
            return "\(baseURL)\(GET_EPISODE)"
        }
        return next
    }
    
    func fetchEpisodes(completion: @escaping(Bool)->()){
        WebApi().request(baseURL: self.getURLString()).subscribe(onNext: {(response: EpisodeModel) in
            self.nextURL = response.info?.next;
            self.episodes.append(contentsOf: response.results ?? [])
            completion(true)
        }, onError: {(error) in
            completion(false)
        }).disposed(by: disposeBag)
    }
    
    func getEpisodesCount() -> Int {return episodes.count}
    
    func getEpisode(at: Int) -> Episode {
        return episodes[at]
    }
    
    func isExistNext() -> Bool {
        guard let nexturlString = self.nextURL else {return false}
        return !(nexturlString.isEmpty)
    }

}
