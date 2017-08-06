//
//  FlickrAPI.swift
//  FlickerPhotoGallery
//
//  Created by Murat Sudan on 06/08/2017.
//  Copyright © 2017 Murat Sudan. All rights reserved.
//

import Foundation


class FlickrAPI {
    
    static func fetchData(completionHandler: @escaping ([FlickrData]?) -> Void ) {
        
        let urlString = "https://api.flickr.com/services/feeds/photos_public.gne?format=json"
        let url = URL(string: urlString)!
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil || (response as! HTTPURLResponse).statusCode != 200 {
                completionHandler(nil)
                return
            }
            
            guard let dataFeed = data else {
                completionHandler(nil)
                return
            }
            
            let rawString = NSString(data: dataFeed, encoding: String.Encoding.utf8.rawValue)
            let start:Int = NSString(string: "jsonFlickrFeed(").length
            let length:Int = rawString!.length
            let end = length - start - 1
            let r = NSMakeRange(start, end)
            let modifiedJsonString = rawString!.substring(with: r)
            let modifiedData = modifiedJsonString.data(using: String.Encoding.utf8)
            
            
            do {
                let jsonData = try JSONSerialization.jsonObject(with: modifiedData!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                
                var flickrItems = [FlickrData]()
                let feeds:[[String: AnyObject]] = jsonData["items"] as! [[String:AnyObject]]
                
                for feed in feeds {
                    
                    let flickr = FlickrData()
                    
                    let authorRaw = feed["author"] as? String
                    let autorModified = authorRaw?.replacingOccurrences(of: "\"", with: "")
                    let rangeStart = autorModified?.range(of: "(")
                    let rangeEnd = autorModified?.range(of: ")", options: String.CompareOptions.backwards)
                    flickr.author = autorModified?[(rangeStart?.upperBound)!..<(rangeEnd?.lowerBound)!]
                    
                    flickr.imgUrlString = (feed["media"] as? Dictionary)?["m"]
                    flickr.title = feed["title"] as? String
                    
                    flickrItems.append(flickr)
                }
                
                completionHandler(flickrItems)
                
                
            } catch let error {
                print(error)
                completionHandler(nil)
            }
        }
        task.resume()
    }
}
