//
//  DetailViewController.swift
//  WKWebViewExample
//
//  Created by Kenta Kodashima on 2019-01-05.
//  Copyright © 2019 Kenta Kodashima. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var webView: WKWebView!
  
  let sampleURL = "https://www.raywenderlich.com/"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    webView.uiDelegate = self
    self.sendRequest(urlString: sampleURL)
  }
}

extension DetailViewController: WKUIDelegate {
  private func sendRequest(urlString: String) {
    let myURL = URL(string: urlString)
    let myRequest = URLRequest(url: myURL!)
    webView.load(myRequest)
  }
}
