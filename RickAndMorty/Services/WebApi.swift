//
//  WebApi.swift
//  RickAndMorty
//
//  Created by Malavika Akhilesh on 11/03/21.
//  Copyright © 2021 Malavika Akhilesh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct WebApi{
    //MARK: - POST & GET Calls
    func request<T: Decodable>(baseURL: String) -> Observable<T>{
        
        return Observable.create { observer in
            let url = URL(string: "\(baseURL)".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
            
            var request = URLRequest(url: url!)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil else {
                    observer.onError(error!)
                    return
                }
                print("Response JSON ================================")
                
                if let responseString = String(data: data, encoding: String.Encoding.utf8){
                    print("\n\n\(responseString) \n\n")
                }
                
                do {
                    let response = try JSONDecoder().decode(T.self, from: data)
                    observer.onNext(response)
                } catch let jsonError {
                    print(jsonError.localizedDescription)
                    observer.onError(jsonError)
                }
                
            }.resume()
            
            return Disposables.create()
            
        }
        
    }
    
}
