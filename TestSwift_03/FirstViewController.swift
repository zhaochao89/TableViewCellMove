//
//  FirstViewController.swift
//  TestSwift_03
//
//  Created by zhaochao on 2017/3/15.
//  Copyright © 2017年 zhaochao. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var redView: UIView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        redView = UIView()
        redView?.x = 100
        redView?.y = 100
        redView?.w = 100
        redView?.h = 100
        redView?.backgroundColor = UIColor.red
        self.view.addSubview(redView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.25, animations: {
            self.redView?.y = 200
        }, completion: nil)
    }
    
    deinit {
        print("销毁")
    }

}
