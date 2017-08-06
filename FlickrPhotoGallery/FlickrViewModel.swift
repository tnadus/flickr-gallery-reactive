//
//  FlickrViewModel.swift
//  FlickrPhotoGallery
//
//  Created by Murat Sudan on 06/08/2017.
//  Copyright © 2017 Murat Sudan. All rights reserved.
//

import UIKit


class FlickrViewModel {
    
    let title = "Flickr Photo Gallery"
    let insetCollectionView = UIEdgeInsetsMake(0.0, 12.0, 0.0, 12.0)
    var datas = [FlickrData]()
    
    init() {
        print("viewmodel is initialized")
        FlickrAPI.fetchData { (fetchedData) in
            if let fData = fetchedData {
                self.datas = fData
            }
        }
    }
}


func fetchImage(urlString: String) {
    
    guard let url = URL(string: urlString) else {
        return
    }
    
    let urlsession = URLSession(configuration: URLSessionConfiguration.default)
    let task = urlsession.dataTask(with: url) { (data, res, error) in
        
        if error != nil || (res as! HTTPURLResponse).statusCode != 200 || data == nil {
            print(error ?? "error when trying to fetch image url")
            return
        }
        
         let img = UIImage(data: data!)
        
        
    }
    
    task.resume()
    
    
}




