//
//  CustomImageView.swift
//  RickAndMorty
//
//  Created by Malavika Akhilesh on 12/03/21.
//  Copyright © 2021 Malavika Akhilesh. All rights reserved.
//

import UIKit

let imgCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {

    var imgUrlString: String?
       
    func loadImageWithUrl(urlString: String){
       
       imgUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
       
       let url : URL = URL(string: imgUrlString ?? "")!
       
       image = nil
       
       if let imageFromCache = imgCache.object(forKey: urlString as AnyObject) as? UIImage{
           self.image = imageFromCache
           return
       }
       
       let req = URLRequest(url: url)

       let task = URLSession.shared.dataTask(with: req as URLRequest, completionHandler: { data, response, error in

           if error != nil {
               //print("error while loading the image")
               return
           }
           
           DispatchQueue.main.async {
               
               let imgToCache = UIImage(data: data!)
               if let imageCached = imgToCache{
                   imgCache.setObject(imageCached, forKey: urlString as AnyObject)
                self.image = imgToCache
               }else{
                   return
               }
           }
           
       })
        task.resume()
       
    }

}

