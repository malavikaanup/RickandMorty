//
//  EpisodesViewController.swift
//  RickAndMorty
//
//  Created by Malavika Akhilesh on 11/03/21.
//  Copyright © 2021 Malavika Akhilesh. All rights reserved.
//

import UIKit


class EpisodesViewController: UIViewController {
    private let cellId = "EPISODECELL"
    private let moreCellId = "MORECELL"
    
    var episodeViewModel: EpisodesViewModel?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collView.backgroundColor = UIColor.clear
        collView.noAutoConst()
        return collView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.9)
//        self.navigationController?.navigationBar.barTintColor = .green
        self.title = "EPISODES"
        episodeViewModel = EpisodesViewModel()
        setupCollectionView()
        
        fetchEpisodes()
        // Do any additional setup after loading the view.
    }
    private func setupCollectionView() {
        self.view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80.0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10.0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        collectionView.register(EpisodeCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(LoadMoreCell.self, forCellWithReuseIdentifier: moreCellId)

        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func fetchEpisodes() {
        self.episodeViewModel?.fetchEpisodes(completion: { (isDone) in
            if isDone{
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
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

//MARK: - CollectionView Methods
extension EpisodesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = self.episodeViewModel?.getEpisodesCount() else {return 0}
        if count == 0 {
            return 0
        }
        guard let hasnext = self.episodeViewModel?.isExistNext() else { return count}
        return hasnext ? count+1 : count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == self.episodeViewModel?.getEpisodesCount() ?? 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: moreCellId, for: indexPath) as! LoadMoreCell
            cell.onClickMore = {
                self.fetchEpisodes()
            }
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EpisodeCell
        cell.episode = self.episodeViewModel?.getEpisode(at: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionInset = (collectionViewLayout as! UICollectionViewFlowLayout).sectionInset
        let referenceHeight: CGFloat = 90 // Approximate height of your cell
        var referenceWidth: CGFloat = collectionView.frame.size.width
        if #available(iOS 11.0, *) {
            referenceWidth = collectionView.safeAreaLayoutGuide.layoutFrame.width
                - sectionInset.left
                - sectionInset.right
                - collectionView.contentInset.left
                - collectionView.contentInset.right
        } else {
            // Fallback on earlier versions
        }
        return CGSize(width: referenceWidth, height: referenceHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let characterVC = CharactersViewController()
        characterVC.charactersInEpisode = self.episodeViewModel?.getEpisode(at: indexPath.item).characters
        self.navigationController?.pushViewController(characterVC, animated: true)
    }
}
