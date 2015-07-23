//
//  ViewController.swift
//  PopularInsta
//
//  Created by Adam Rais on 20/07/2015.
//  Copyright (c) 2015 Adamgoodapp. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setInstaPost() {
        let url = NSURL(string: "https://api.instagram.com/v1/media/popular?access_token=349039511.1fb234f.e1d2b031551242db806ff8ec12c4b376")
        var request = NSURLRequest(URL: url!)
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        if data != nil {
            var insta = JSON(data: data!)
            
//            if let userName = insta["data"][0]["user"]["username"].string {
//                self.userNameLabel.setText(userName)
//            }
//            
//            if let userImage = insta["data"][0]["images"]["standard_resolution"]["url"].string{
//                let url = NSURL(string: userImage)
//                let data = NSData(contentsOfURL: url!)
//                self.buttonImage.setBackgroundImage(UIImage(data: data!))
//            }
        }
        
    }



}

