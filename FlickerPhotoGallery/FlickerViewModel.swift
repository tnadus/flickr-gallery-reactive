//
//  FlickerViewModel.swift
//  FlickerPhotoGallery
//
//  Created by Murat Sudan on 06/08/2017.
//  Copyright © 2017 Murat Sudan. All rights reserved.
//

import Foundation


class FlickerViewModel {
    
    var datas: [FlickerData] = {
        var source = [FlickerData]()
        
        let data1 = FlickerData()
        data1.title = "Antalya"
        data1.author = "mahmut"
        data1.imgName = "photo"
        source.append(data1)
        
        let data2 = FlickerData()
        data2.title = "Istanbul"
        data2.author = "fatih"
        data2.imgName = "photo"
        source.append(data2)
        
        let data3 = FlickerData()
        data3.title = "London"
        data3.author = "murat"
        data3.imgName = "photo"
        source.append(data3)
        
        return source
    }()
    
    static func fetchData(completionHandler: ([FlickerData]) -> Void) {
        
        var source = [FlickerData]()
    
        let data1 = FlickerData()
        data1.title = "Antalya"
        data1.author = "mahmut"
        source.append(data1)
        
        let data2 = FlickerData()
        data2.title = "Istanbul"
        data2.author = "fatih"
        source.append(data2)
        
        let data3 = FlickerData()
        data3.title = "London"
        data3.author = "murat"
        source.append(data3)
    
        completionHandler(source)
    }
    
    
}
