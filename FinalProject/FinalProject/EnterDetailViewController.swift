//
//  EnterDetailViewController.swift
//  FinalProject
//
//  Created by Wang, Xinyang on 12/4/18.
//  Copyright © 2018 Wang, Xinyang. All rights reserved.
//

import UIKit

class EnterDetailViewController: UIViewController, UITextFieldDelegate {

    var myModel: Model?
    
    @IBOutlet weak var totalText: UITextView!
    
    @IBOutlet weak var MoneyTF: UITextField!
    @IBOutlet weak var DetailTF: UITextField!
    @IBOutlet weak var types: UISwitch!
    @IBAction func ButtonSave(_ sender: Any) {
        var moneyDetail = self.MoneyTF?.text
        let detailDetail = self.DetailTF?.text
        if (moneyDetail != "" && detailDetail != ""){
            if (types.isOn){
                moneyDetail = "-" + moneyDetail!
            }else{
                moneyDetail = "+" + moneyDetail!
            }
            myModel?.money.append(moneyDetail!)
            myModel?.detail.append(detailDetail!)
            MoneyTF.text = ""
            DetailTF.text = ""
        }
        
        let lFileManager = FileManager()
        let lDocumentsDirectoryURL = try! lFileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        
        let aHistoryArchivedData = NSKeyedArchiver.archivedData(withRootObject: myModel)
        
        let myDataFileURL = lDocumentsDirectoryURL.appendingPathComponent("FinalDataFile.binary")
        
        try? aHistoryArchivedData.write(to: myDataFileURL, options: [.atomic])

        // create var, read them somewhere
    }
    
 /*   @IBAction func ButtonAccount(_ sender: Any) {
        let lFileManager = FileManager()
        let lDocumentsDirectoryURL = try! lFileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let myDataFileURL = lDocumentsDirectoryURL.appendingPathComponent("FinalDataFile.binary")
        
        // warning! here do error testing to prevent
        //   the app crashing if you try reading from a file that does not exist!
        
        let lAccountData = try! Data(contentsOf: myDataFileURL)
        let lAccount = NSKeyedUnarchiver.unarchiveObject(with: lAccountData) as! Model
        
        print("This is history" + "\(lAccount)")
        
        totalText.text = totalText.text + "\(lAccount)" + "--------\n"
    
    }*/
    
    @IBAction func HistoryButton(_ sender: Any) {
        let lFileManager = FileManager()
        let lDocumentsDirectoryURL = try! lFileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let myDataFileURL = lDocumentsDirectoryURL.appendingPathComponent("FinalDataFile.binary")
        
        // warning! here do error testing to prevent
        //   the app crashing if you try reading from a file that does not exist!
        
        let lAccountData = try! Data(contentsOf: myDataFileURL)
        let lAccount = NSKeyedUnarchiver.unarchiveObject(with: lAccountData) as! Model
        
        print("This is history" + "\(lAccount)")
        
        totalText.text = totalText.text + "\(lAccount)" + "--------\n"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        myModel = appDelegate.theModel
        

        // Do any additional setup after loading the view.
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

}
