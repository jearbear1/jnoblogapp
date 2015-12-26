//
//  ViewController.swift
//  jnoblogwebapp
//
//  Created by Jeremiah Onwubuya on 12/26/15.
//  Copyright © 2015 Jeremiah Onwubuya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.jnoblog.com")!
        
         // webView.loadRequest(NSURLRequest(URL: url))
   
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if let urlContent = data {
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    self.webView.loadHTMLString(String(webContent), baseURL: nil)
                })
                
                
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goBack(sender: AnyObject) {
        webView.goBack()
    }
    
    
    @IBAction func goForward(sender: AnyObject) {
        webView.goForward()
    }
    

}

