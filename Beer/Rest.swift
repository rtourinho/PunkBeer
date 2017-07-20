//
//  REST.swift
//  REST
//
//  Created by Ricardo Tourinho on 19/07/17.
//  Copyright © 2017 Ricardo Tourinho. All rights reserved.
//

import Foundation

class REST {
    
    static let basePath = "https://api.punkapi.com/v2/beers"
    static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        //URLSessionConfiguration.ephemeral //Modo privado. apaga cookies, cache, etc
        //URLSessionConfiguration.background(withIdentifier: "bg")
        
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 4
        
        return config
    }()
    
    //static let session = URLSession.shared
    static let session = URLSession(configuration: configuration)
    
    static func loadBeers(onComplete: @escaping ([Beer]?) -> Void) {
        guard let url = URL(string: basePath) else {
            onComplete(nil)
            return
        }
        //GET
        session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                onComplete(nil)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                if response.statusCode == 200 {
                    
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                    var beers: [Beer] = []
                    for item in json {
                        let beer = Beer()
                        if let name = item["name"] as? String {
                            beer.name = name
                        }
                        if let tagline = item["tagline"] as? String {
                            beer.tagline = tagline
                        }
                        if let first_brewed = item["first_brewed"] as? String {
                            beer.first_brewed = first_brewed
                        }
                        if let description = item["description"] as? String {
                            beer.description = description
                        }
                        if let image_url = item["image_url"] as? String {
                            beer.image_url = image_url
                        }
                        if let id = item["id"] as? Int {
                            beer.id = id
                        }
                        if let abv = item["abv"] as? Double {
                            beer.abv = abv
                        }
                        if let ibu = item["ibu"] as? Double {
                            beer.ibu = ibu
                        }
                        beers.append(beer)
                    }
                    onComplete(beers)
                    
                } else {
                    onComplete(nil)
                }
            }
            }.resume()
    }
}
