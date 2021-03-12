//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Malavika Akhilesh on 12/03/21.
//  Copyright © 2021 Malavika Akhilesh. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {
    private let cellIdentifier = "CHARACTERCELLID"
    
    let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collView.backgroundColor = UIColor.clear
        collView.noAutoConst()
        return collView
    }()
    
    var characterViewModel: CharacterViewModel?
    
    var charactersInEpisode:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterViewModel = CharacterViewModel()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        self.title = "CHARACTERS"
        self.setupCollectionView()
        self.fetchEpisodeCharacters()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupCollectionView() {
        self.view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 90).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func fetchEpisodeCharacters() {
        if let episodeCharacters = charactersInEpisode {
            for character in episodeCharacters {
                self.characterViewModel?.fetchCharacters(urlString: character, completion: { (isDone) in
                    if isDone{
                        print(self.characterViewModel?.getCharacterCount() ?? 0)
                    }
                })
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.characterViewModel?.getCharacterCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CharacterCell
        cell.characterModel = self.characterViewModel?.getCharacter(at: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width-10)/2, height: 300.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}
