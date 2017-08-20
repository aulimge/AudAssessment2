//
//  WebViewController.swift
//  Week2Assessment - Audrey
//
//  Created by Audrey Lim on 18/08/2017.
//  Copyright © 2017 Audrey Lim. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    
    var productURLString : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.delegate = self
        
        //load website
        let prodURL = productURLString
        print(prodURL)
        loadURL(with: prodURL)
        
    }

    
    func loadURL(with string : String) {
        
        guard let url = URL(string: string) else {
            print("Invalid URLString : \(string)")
            return
        }
        
        let request = URLRequest(url: url)
        webView.loadRequest(request)
        
    }
    

    //show loading icon
    func webViewDidStartLoad(_ webView: UIWebView) {
        loadingView.startAnimating()
        print("Start Loading...")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadingView.stopAnimating()
        print("Finish Loading...")
    }
    
    

}
