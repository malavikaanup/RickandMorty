//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Malavika Akhilesh on 12/03/21.
//  Copyright © 2021 Malavika Akhilesh. All rights reserved.
//

import UIKit

class CharacterCell: BaseCell {
    
    private func getStatusColor(status: Status) -> UIColor {
        switch status {
        case .alive:
            return UIColor.green
        case .dead:
            return UIColor.red
        default:
            return UIColor.orange
        }
    }
    
    private func getGenderIcon(gender: Gender) -> UIImage {
        switch gender {
        case .female:
            return #imageLiteral(resourceName: "female")
        case .male:
            return #imageLiteral(resourceName: "male")
        default:
            return #imageLiteral(resourceName: "user_name_icon")
        }
    }
    
    var characterModel: Character? {
        didSet {
            if let model = characterModel {
                characterImgView.loadImageWithUrl(urlString: model.image ?? "")
                imgIcon.image = getGenderIcon(gender: model.gender ?? Gender.unknown).withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
                imgIcon.tintColor = getStatusColor(status: model.status ?? Status.unknown)
                lblName.text = model.name
                lblOptions.text = model.species
                lblOrigin.text = "Origin: \(model.origin?.name ?? "")"
                lblLocation.text = "Location: \(model.location?.name ?? "")"
            }
        }
    }
    let characterImgView: CustomImageView = {
        let imgView = CustomImageView()
        imgView.contentMode = .scaleToFill
        imgView.layer.masksToBounds = false
        imgView.noAutoConst()
        return imgView
    }()
    
    let lblName: UILabel = {
        let lbl = UILabel()
        lbl.noAutoConst()
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let lblOrigin: UILabel = {
        let lbl = UILabel()
        lbl.noAutoConst()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        return lbl
    }()
    let lblLocation: UILabel = {
        let lbl = UILabel()
        lbl.noAutoConst()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override func setupViews() {
        self.addSubview(bgView)
        bgView.addSubview(characterImgView)
        bgView.addSubview(lblOptions)
        bgView.addSubview(imgIcon)
        bgView.addSubview(lblName)
        bgView.addSubview(lblOrigin)
        bgView.addSubview(lblLocation)
        
        bgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5.0).isActive = true
        bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5.0).isActive = true
        bgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0).isActive = true
        bgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0).isActive = true
        
        characterImgView.topAnchor.constraint(equalTo: bgView.topAnchor).isActive = true
        characterImgView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor).isActive = true
        characterImgView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor).isActive = true
        
        imgIcon.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -5.0).isActive = true
        imgIcon.topAnchor.constraint(equalTo: characterImgView.bottomAnchor).isActive = true
        imgIcon.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        imgIcon.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        lblName.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 5.0).isActive = true
        lblName.trailingAnchor.constraint(equalTo: imgIcon.leadingAnchor, constant: -5.0).isActive = true
        lblName.topAnchor.constraint(equalTo: characterImgView.bottomAnchor).isActive = true
        
        lblOptions.leadingAnchor.constraint(equalTo: lblName.leadingAnchor).isActive = true
        lblOptions.trailingAnchor.constraint(equalTo: lblName.trailingAnchor).isActive = true
        lblOptions.topAnchor.constraint(equalTo: lblName.bottomAnchor).isActive = true
        lblOptions.bottomAnchor.constraint(equalTo: lblOrigin.topAnchor).isActive = true
        
        lblOrigin.leadingAnchor.constraint(equalTo: lblName.leadingAnchor).isActive = true
        lblOrigin.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -5.0).isActive = true
        lblOrigin.bottomAnchor.constraint(equalTo: lblLocation.topAnchor).isActive = true
        lblOrigin.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
        
        lblLocation.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -5.0).isActive = true
        lblLocation.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 5.0).isActive = true
        lblLocation.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -5.0).isActive = true
        lblLocation.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
    }
    
}
