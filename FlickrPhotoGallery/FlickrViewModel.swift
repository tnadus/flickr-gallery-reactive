//
//  FlickrViewModel.swift
//  FlickrPhotoGallery
//
//  Created by Murat Sudan on 06/08/2017.
//  Copyright © 2017 Murat Sudan. All rights reserved.
//

import UIKit
import RxSwift

class FlickrViewModel {
    
    let title = "Flickr Photo Gallery"
    let insetCollectionView = UIEdgeInsetsMake(0.0, 12.0, 0.0, 12.0)
    let cache = NSCache<AnyObject, AnyObject>()
    
    var datas = Variable<[FlickrData]>([])
    
    init() {
        FlickrAPI.fetchData { (fetchedData) in
            if let fData = fetchedData {
                self.datas.value = fData
            }
        }
    }
    
    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        if let img = cache.object(forKey: urlString as AnyObject) as? UIImage {
            completion(img)
            return
        }
        
        ImageLoader.load(urlString: urlString) { data in
         
            if let dataImg = data {
                let img = UIImage(data: dataImg)
                self.cache.setObject(img!, forKey: urlString as AnyObject)
                completion(img)
            }
        }
    }
}





