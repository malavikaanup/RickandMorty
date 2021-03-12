//
//  EpisodeCell.swift
//  RickAndMorty
//
//  Created by Malavika Akhilesh on 11/03/21.
//  Copyright © 2021 Malavika Akhilesh. All rights reserved.
//

import UIKit

class EpisodeCell: BaseCell {
    
    var episode: Episode? {
        didSet{
            if let model = episode {
                lblOptions.text = "\(model.name ?? "") - \(model.episode ?? "")"
                lblDate.text = "\(model.airDate ?? "")"
            }
        }
    }
    
    let lblDate: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textColor = UIColor.darkGray
        lbl.noAutoConst()
        return lbl
    }()
    
    override func setupViews() {
        self.backgroundColor = UIColor.clear
        self.addSubview(bgView)
        bgView.addSubview(lblOptions)
        bgView.addSubview(lblDate)
        
        bgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0).isActive = true
        bgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0).isActive = true
        bgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5.0).isActive = true
        bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        lblOptions.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 10.0).isActive = true
        lblOptions.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -10.0).isActive = true
        lblOptions.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 10.0).isActive = true
        
        lblDate.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 10.0).isActive = true
        lblDate.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -10.0).isActive = true
        lblDate.topAnchor.constraint(equalTo: lblOptions.bottomAnchor, constant: 5.0).isActive = true
//        lblDate.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -10.0).isActive = true
    }
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        lblOptions.preferredMaxLayoutWidth = layoutAttributes.size.width - contentView.layoutMargins.left - contentView.layoutMargins.left
        layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return layoutAttributes
    }
}
