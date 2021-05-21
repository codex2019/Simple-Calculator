//
//  ApplyViewController.swift
//  JobSearch
//
//  Created by MacX on 5/10/21.
//

import UIKit
import WebKit

class ApplyViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var applyUrl = ""
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: applyUrl)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
