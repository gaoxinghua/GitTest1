//
//  ViewController.swift
//  Git_练习
//
//  Created by 高兴华 on 16/8/2.
//  Copyright © 2016年 高兴华. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string:"http://www.baidu.com")
        
        //'_' 标示忽略,session默认超时时长 60s
        NSURLSession.sharedSession().dataTaskWithURL(url!)
        { (data, _, _) -> Void in
            
            
            //json是一个特殊格式的字符串
            let jsonStr = "[\"hello\",\"world\"]"
            let jsonData = jsonStr.dataUsingEncoding(NSUTF8StringEncoding)
            
            //反序列化
            //播或异常
            do{
                let aaa = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: [])
                print("111") //
            }catch{
                print(error)
            }
            
            //
            
            
            //强try
            //            let result = try! NSJSONSerialization.JSONObjectWithData(jsonData!, options: [NSJSONReadingOptions.MutableContainers,NSJSONReadingOptions.MutableLeaves])
            
            //尝试try
            guard let result = try? NSJSONSerialization.JSONObjectWithData(jsonData!, options: [NSJSONReadingOptions.MutableContainers,NSJSONReadingOptions.MutableLeaves]) else{
                print("反序列化失败")
                return
            }
            
            print(result)
            
            }.resume()
        
    }
    
    //我是主线,我继续开发
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

