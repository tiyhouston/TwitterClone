//
//  TwitterTableViewController.swift
//  TwitterCloneApp
//
//  Created by rem{e}koh on 11/4/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

import UIKit

class TwitterTableViewController: UITableViewController {
    
    var tweets : [Tweet]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "Twitter_Logo_Blue.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        populateTableView()
        
    }
    
    func populateTableView() {
        
        self.tweets = [Tweet]()
        
        let tweetsAPI = "https://twitclone-example.now.sh/api/tweet"
        
        let url = URL(string: tweetsAPI)
        
        URLSession.shared.dataTask(with: url!) { (data : Data?, response: URLResponse?, error: Error?) in
            
            let tweetsArray = try! JSONSerialization.jsonObject(with: data!, options: []) as! [[String:Any]]
            
            for item in tweetsArray {
                
                let tweet = Tweet()
                
                tweet.content = item["content"] as! String
                
                let userDictionary = item["user"] as? [String:Any]
                
                if userDictionary != nil {
                    
                    tweet.avatarURL = ((userDictionary?["avatarURL"])!) as! String
                    tweet.userName = ((userDictionary?["username"])!) as! String
//                    print((userDictionary?["avatarURL"])!)
                }
                
                else {
                    tweet.avatarURL = "https://placehold.it/80x60"
                }
                
                self.tweets.append(tweet)
                
            }
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }

        }.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.tweets.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath) as! TweetTableViewCell

        let  tweet = tweets[indexPath.row]
        
        cell.userNameLabel?.text = tweet.userName
        cell.userNameLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
        cell.contentLabel?.text = tweet.content
        
        DispatchQueue.global().async {
            
            let imageData = try! Data(contentsOf: URL(string: tweet.avatarURL)!)
        
            DispatchQueue.main.async {
                
                cell.avatarImageView?.image = UIImage(data: imageData)
            
            }
        }

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
