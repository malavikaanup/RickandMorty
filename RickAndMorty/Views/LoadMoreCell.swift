//
//  LoadMoreCell.swift
//  RickAndMorty
//
//  Created by Malavika Akhilesh on 12/03/21.
//  Copyright © 2021 Malavika Akhilesh. All rights reserved.
//

import UIKit

class LoadMoreCell: BaseCell {
    var onClickMore:(()->())?
    let btnMore: UIButton = {
        let btn = UIButton()
        btn.setTitle("LOAD MORE", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.noAutoConst()
        return btn
    }()
    
    override func setupViews() {
        self.addSubview(btnMore)
        btnMore.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        btnMore.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        btnMore.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        btnMore.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        btnMore.addTarget(self, action: #selector(onclicked(_:)), for: .touchUpInside)
    }
    
    @objc func onclicked(_ sender: UIButton){
        self.onClickMore?()
    }
    
}
