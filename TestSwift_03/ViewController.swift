//
//  ViewController.swift
//  TestSwift_03
//
//  Created by zhaochao on 2017/3/15.
//  Copyright © 2017年 zhaochao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView? = nil
    var dataList: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let leftBar = UIBarButtonItem.init(title: "下一页", style: .plain, target: self, action: #selector(self.puchAction))
        self.navigationItem.leftBarButtonItem = leftBar
        
//        let rightBar = UIBarButtonItem.init(title: "编辑", style: .plain, target: self, action: #selector(self.editBtnAction))
        
        let rightBtn = UIButton.init(type: UIButtonType.custom)
        rightBtn.setTitle("编辑", for: UIControlState.normal)
        rightBtn.setTitle("完成", for: UIControlState.selected)
        rightBtn.sizeToFit()
        rightBtn.setTitleColor(UIColor.blue, for: .normal)
        rightBtn.addTarget(self, action: #selector(self.rightBtnAction(_:)), for: UIControlEvents.touchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightBtn)
        
        dataList = ["测试1", "测试2", "测试3", "测试4", "测试5"]
        self.setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.tableView != nil {
            self.tableView?.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func puchAction() {
        let firstVC = FirstViewController()
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
    
    func editBtnAction() {
        self.tableView?.setEditing(true, animated: true)
    }
    
    func rightBtnAction(_ btn: UIButton) {
        btn.isSelected = !btn.isSelected
        if btn.isSelected {
            self.tableView?.setEditing(true, animated: true)
        } else {
            self.tableView?.setEditing(false, animated: true)
        }
    }
    
    func setupTableView() {
        self.tableView = UITableView(frame: self.view.bounds, style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(self.tableView!)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "cellid"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellid)
        }
        cell?.textLabel?.text = self.dataList.object(at: indexPath.row) as? String
        return cell!
    }
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.dataList.removeObject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("sourceIndexRow: \(sourceIndexPath.row)  destinationIndexRow: \(destinationIndexPath.row)")
        let moveObj = self.dataList.object(at: sourceIndexPath.row)
        self.dataList.removeObject(at: sourceIndexPath.row)
        self.dataList.insert(moveObj, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

