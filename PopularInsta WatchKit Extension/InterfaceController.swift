//
//  InterfaceController.swift
//  PopularInsta WatchKit Extension
//
//  Created by Adam Rais on 20/07/2015.
//  Copyright (c) 2015 Adamgoodapp. All rights reserved.
//

import WatchKit
import Foundation
import SwiftyJSON


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var instagramPostTable: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        setInstaPost()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func setInstaPost() {
        let url = NSURL(string: "https://api.instagram.com/v1/media/popular?access_token=349039511.1fb234f.e1d2b031551242db806ff8ec12c4b376")
        var request = NSURLRequest(URL: url!)
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        if data != nil {
            var insta = JSON(data: data!)
            
            instagramPostTable.setNumberOfRows(8, withRowType: "InstagramPostTableRowController")
            
            for (index, post) in enumerate(insta["data"]) {
                if index <= 7 {
                    let row = instagramPostTable.rowControllerAtIndex(index) as! InstagramPostTableRowController
                    
                    if let userName = post.1["user"]["username"].string {
                        row.interfaceLabel.setText(userName)
                    }
                    
                    if let userImage = post.1["images"]["low_resolution"]["url"].string{
                        let url = NSURL(string: userImage)
                        let data = NSData(contentsOfURL: url!)
                        row.interfaceImage.setImage(UIImage(data: data!))
                    }
                }
            }
            
        }
        
    }


}
