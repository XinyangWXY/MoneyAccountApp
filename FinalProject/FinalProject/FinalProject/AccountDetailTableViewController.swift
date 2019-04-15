//
//  AccountDetailTableViewController.swift
//  FinalProject
//
//  Created by Wang, Xinyang on 12/4/18.
//  Copyright © 2018 Wang, Xinyang. All rights reserved.
//

import UIKit

class AccountDetailTableViewController: UITableViewController{
    
    var totalMoney = 0.0
    var myModel: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        myModel = appDelegate.theModel
        
        
        let show = navigationController?.viewControllers[1] as! UITableViewController
        show.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myModel!.money.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        totalMoney = (myModel?.add(firstNum: totalMoney, secondNum: (myModel?.strToDou(element: (myModel?.money[indexPath.row])!))!))!
        
        if let inputMoney = myModel?.strToDou(element: (myModel?.money[indexPath.row])!){
            if inputMoney > 0.0{
                cell.textLabel?.textColor = UIColor.red
            }else if inputMoney < 0.0{
                cell.textLabel?.textColor = UIColor.blue
            }else{
                cell.textLabel?.textColor = UIColor.green
            }
        }
        cell.textLabel?.text = myModel?.money[indexPath.row]
        cell.detailTextLabel?.text = (myModel?.detail[indexPath.row])! + "    Total: " + (myModel?.DouTostr(givenNum: totalMoney))!
        
        return cell
    }
    
    
    
}

