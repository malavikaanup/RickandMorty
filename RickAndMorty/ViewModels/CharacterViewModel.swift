//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Malavika Akhilesh on 12/03/21.
//  Copyright © 2021 Malavika Akhilesh. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CharacterViewModel: NSObject {
    let disposeBag = DisposeBag()
    
    private var characters: [Character] = []
    
    func fetchCharacters(urlString: String, completion: @escaping(Bool)->()) {
        WebApi().request(baseURL: urlString).subscribe(onNext: { (response: Character) in
            self.characters.append(response)
            completion(true)
        }, onError: { (error:Error) in
            completion(false)
        }).disposed(by: disposeBag)
    }
    
    func getCharacterCount() -> Int {return characters.count}
    
    func getCharacter(at: Int) -> Character {
        return characters[at]
    }
}
