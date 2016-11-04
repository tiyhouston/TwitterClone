//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true



let tweetsAPI = "https://twitclone-example.now.sh/api/tweet"

let url = URL(string: tweetsAPI)

URLSession.shared.dataTask(with: url!) { (data : Data?, response: URLResponse?, error: Error?) in
    
    let tweetsArray = try! JSONSerialization.jsonObject(with: data!, options: []) as! [[String:Any]]
    
    for item in tweetsArray {
        
        let userDictionary = item["user"] as? [String:Any]
        
        if userDictionary != nil {
             print((userDictionary?["avatarURL"])!)
        }
        
       
        
      //  let tweet = Tweet()
      //  tweet.avatarURL = item[0]["user":["avatarURL"]] as! String
        
        
      //  let user = item["user"] as! [String:Any]
      //  tweet.avatarURL =  user["avatarURL"] as! String!
        
        
        
    }
    
}.resume()

