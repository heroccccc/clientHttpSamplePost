//
//  ViewController.swift
//  clientHttpSamplePost
//
//  Created by 高橋博司 on 2018/07/01.
//  Copyright © 2018年 takahashi. All rights reserved.
//

import UIKit

//https://wilfergy.com/post-77/を参考
public class HttpClientImpl {
    
    private let session: URLSession
    
    public init(config: URLSessionConfiguration? = nil) {
        self.session = config.map { URLSession(configuration: $0) } ?? URLSession.shared
    }
    
    public func execute(request: URLRequest) -> (NSData?, URLResponse?, NSError?) {
        var d: NSData? = nil
        var r: URLResponse? = nil
        var e: NSError? = nil
        let semaphore = DispatchSemaphore(value: 0)
        session
            .dataTask(with: request) { (data, response, error) -> Void in
                d = data as NSData?
                r = response
                e = error as NSError?
                semaphore.signal()
            }
            .resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        return (d, r, e)
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //connectボタンを押したらhttprequestを送信
    @IBAction func connect(_ sender: Any) {
        
        //googlehomeに話させる言葉
        let comment:String = "こんにちは"
        
        //ver googlehomeと通信する間のserverのIPアドレス
        //http://serverIPアドレス:ポート/google-home-notifier
        let myUrl:URL = URL(string: "http://serverIPadress:port/google-home-notifier")!
        let req = NSMutableURLRequest(url: myUrl)
        
        //bodyの中身
        let postText = "text=" + comment
        let postData = postText.data(using: String.Encoding.utf8)
        
        //POSTで送ります
        //GETでも可（今回は省略）
        req.httpMethod = "POST"
        req.httpBody = postData
        
        let myHttpSession = HttpClientImpl()
        let (data, _, _) = myHttpSession.execute(request: req as URLRequest)
        if data != nil {
            // 受け取ったデータ,responseに対する処理
            let response = NSString(data: data! as Data, encoding: String.Encoding.utf8.rawValue)
            print(response)
        }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

