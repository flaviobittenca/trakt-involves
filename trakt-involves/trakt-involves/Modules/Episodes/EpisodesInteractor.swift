//
//  EpisodesInteractor.swift
//  trakt-involves
//
//  Created by iMac on 28/07/17.
//  Copyright © 2017 Flavio Kruger Bittencourt. All rights reserved.
//

import RxSwift

class EpisodesInteractor: EpisodesInteractorInputProtocol {
    
    weak var interactorOutput: EpisodesInteractorOutputProtocol?
    
    fileprivate var disposeBag = DisposeBag()
    
    func fetchAllEpisodes(for id: Int, and seasonNumber: Int) {
        EpisodeAPI.getAllEpisodes(for: id, and: seasonNumber)
            .observeOn(MainScheduler.instance)
            .map({
                return $0.map {
                    RealmManager.saveEpisode($0, showId: id)
                    
                    return EpisodeViewData(title: $0.title,
                                           number: $0.number,
                                           season: $0.season,
                                           tracktId: $0.ids!.trakt,
                                           tvdb: $0.ids?.tvdb,
                                           overview: $0.overview,
                                           firstAired: $0.firstAired)
                }
            })
            .subscribe(onNext: { episodes in
                self.interactorOutput?.fetchedEpisodes(episodes)
            }, onError: { error in
                
            }).addDisposableTo(disposeBag)
    }
}

