//
//  FlickerCell.swift
//  FlickerPhotoGallery
//
//  Created by Murat Sudan on 06/08/2017.
//  Copyright © 2017 Murat Sudan. All rights reserved.
//

import UIKit

class FlickerCell: UICollectionViewCell {
    
    var data: FlickerData? {
        didSet {
            
            guard let imgName = data?.imgName else {
                return
            }
            photoImgView.image = UIImage(named: imgName)
            
            guard let artistName = data?.author else {
                return
            }
            artistLabel.text = artistName
            
            guard let titleName = data?.title  else {
                return
            }
            
            titleLabel.text = titleName
        }
    }
    
    let photoImgView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.backgroundColor = .blue
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let artistLabel: UILabel = {
        let l = UILabel(frame: .zero)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .green
        l.text = "Murat"
        return l
    }()
    
    let titleLabel: UILabel = {
        let l = UILabel(frame: .zero)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .red
        l.text = "Ankara"
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        self.addSubview(photoImgView)
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[pv]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["pv" : photoImgView]))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[pv]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["pv" : photoImgView]))
        
        self.addSubview(artistLabel)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[al]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["al" : artistLabel]))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[al(==33)]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["al" : artistLabel]))
    
        self.addSubview(titleLabel)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[tl]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["tl" : titleLabel]))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[tl(==33)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["tl" : titleLabel]))
    }
    
    
}
