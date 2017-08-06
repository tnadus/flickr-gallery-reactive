//
//  FlickrCell.swift
//  FlickrPhotoGallery
//
//  Created by Murat Sudan on 06/08/2017.
//  Copyright © 2017 Murat Sudan. All rights reserved.
//

import UIKit

class FlickrCell: UICollectionViewCell {
    
    var urlString = ""
        
    let photoImgView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.backgroundColor = .black
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let artistLabel: UILabel = {
        let l = UILabel(frame: .zero)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = UIColor(white: 0.3, alpha: 0.7)
        l.textColor = .white
        
        return l
    }()
    
    let titleLabel: UILabel = {
        let l = UILabel(frame: .zero)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = UIColor(white: 0.3, alpha: 0.7)
        l.textColor = .white
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
