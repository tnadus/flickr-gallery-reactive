//
//  ViewController.swift
//  FlickrPhotoGallery
//
//  Created by Murat Sudan on 06/08/2017.
//  Copyright © 2017 Murat Sudan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    
    let flickrModelView = FlickrViewModel()
    let disposeBag = DisposeBag()

    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .lightGray
        return cv
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupViews()
        setupBindings()
    }
    
    func setupViews() {
        title = flickrModelView.title
        setupCollectionView()
    }
    
    func setupCollectionView() {
        self.view.addSubview(collectionView)
        
        collectionView.register(FlickrCell.self, forCellWithReuseIdentifier: cellId)
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[cv]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["cv": collectionView]))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[cv]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["cv": collectionView]))
    }
    
    func setupBindings() {
        
        flickrModelView.datas.asObservable().filter({ datas -> Bool in
            return datas.count > 0
        })
            .bind(to: collectionView.rx.items) {[unowned self] (collectionView, row, element) in
            let indexPath = IndexPath(row: row, section: 0)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! FlickrCell
            cell.data = self.flickrModelView.datas.value[indexPath.row]
            return cell
            }
            .disposed(by: disposeBag)
        
        collectionView.rx.setDelegate(self).addDisposableTo(disposeBag)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.view.frame.width - flickrModelView.insetCollectionView.left - flickrModelView.insetCollectionView.right, height: 240.0)
        return size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
