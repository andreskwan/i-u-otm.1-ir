//
//  ViewController.swift
//  ImageRequest
//
//  Created by Jarrod Parkes on 11/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //needs to be initialized before being capture by the closure 
        var image = UIImage()
        // TODO: Add all the networking code here!
        let catUrl = NSURL.init(string: Constants.CatURL)
        let task = NSURLSession.sharedSession().dataTaskWithURL(catUrl!) { (data, response, error) in
            if((error == nil)){
                print("task finished")
                image = UIImage(data: data!)!
                //whitout this autolayout-constrains will be affected, which 
                //can lead to a future crash 
                //1- dispatch asynch
                //2- get main thread and 
                //3- present the image after it has been downloaded
                dispatch_async(dispatch_get_main_queue(), { 
                    self.imageView.image = image
                })
            }
        }
        task.resume()
        //here image is empty
        //imageView.image = image
    }
}
