//
//  DWDispatchTestViewController.swift
//  SwiftCollection
//
//  Created by onewh on 2018/7/16.
//  Copyright © 2018年 onewh. All rights reserved.
//

import UIKit

class DWDispatchTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        testGroup()
        testQos()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testQos() {
        for i in 0...9 {
            DispatchQueue.global(qos: .default).async {
                print("default",i)
            }
            DispatchQueue.global(qos: .background).async {
                print("background",i)
            }
            DispatchQueue.global(qos: .unspecified).async {
                print("unspecified",i)
            }
            DispatchQueue.global(qos: .userInteractive).async {
                print("userInteractive",i)
            }
            DispatchQueue.global(qos: .userInitiated).async {
                print("userInitiated",i)
            }
            DispatchQueue.global(qos: .userInitiated).sync {
                print("userInitiated sync",i)
            }
            DispatchQueue.global(qos: .utility).async {
                print("utility",i)
            }

            DispatchQueue.main.async {
                print("main async",i)
            }
        }
    }
    
    func testGroup()  {
        let group =  DispatchGroup()
        //添加队列
        group.enter()
        let queue = DispatchQueue.global()
        queue.async {
            for i in 0...100{
                print("全局队列\(i)")
            }
            //出队列
            group.leave()
        }
        //如果需要上个队列完成后再执行可以用wait
        //group.wait()
        group.enter()
        let queue2 = DispatchQueue(label: "com.test.queue2", attributes: .concurrent)
        queue2.sync {
            
            for i in 0...10{
                print("queue2",i)
            }
            group.leave()
        }
        //全部执行完毕后通知
        group.notify(queue: DispatchQueue.global()) {
            print("队列执行完毕")
        }
        
        group.enter()
        let queue3 = DispatchQueue(label: "com.test.queue3", qos: .utility, attributes: .concurrent, autoreleaseFrequency: .inherit, target: DispatchQueue.global())
        queue3.async {
            for i in 0...10{
                print("queue3",i)
            }
            group.leave()
        }
        
        group.enter()
        let queue4 = DispatchQueue.init(label: "com.test.queue4")
        queue4.async {
            for i in 0...10{
                print("queue4",i)
            }
            group.leave()
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
