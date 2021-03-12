//
//  BaseCell.swift
//  RickAndMorty
//
//  Created by Malavika Akhilesh on 11/03/21.
//  Copyright © 2021 Malavika Akhilesh. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.noAutoConst()
        return view
    }()

    let imgIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.layer.masksToBounds = true
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        imgView.tintColor = UIColor.blue
        imgView.noAutoConst()
        return imgView
        
    }()

    let lblOptions: UILabel = {
        let lbl = UILabel()
        lbl.noAutoConst()
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews(){
        
    }
}
