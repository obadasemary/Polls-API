//
//  ViewController.swift
//  Polls API
//
//  Created by Abdelrahman Mohamed on 6/6/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let url = "http://api.nobala.edu.sa/api/NobalaMobile/get10news"
        
        downloadQuestion(url) { (array) in
            
            print("download")
        }
    }
    
    func downloadQuestion(urlString: String, complethionHandler:(array: NSArray) -> ()) {
        
        let url = NSURL(string: urlString)
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            
            do {
                
                let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                
                print(jsonDictionary)
                
//                let list = jsonDictionary[0]["choices"] as! NSArray
//                
//                print(list)
//                
//                for le in list {
//                    let choice = le["choice"] as! String
//                    let urls = le["url"] as! String
//                    let votes = le["votes"] as! NSNumber
//                    print(choice)
//                    print(urls)
//                    print(votes)
//                }
                
            } catch {
                print("invalid json format")
            }
            
        }
        task.resume()
    }

}

