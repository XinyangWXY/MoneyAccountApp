//
//  Model.swift
//  FinalProject
//
//  Created by Wang, Xinyang on 12/4/18.
//  Copyright © 2018 Wang, Xinyang. All rights reserved.
//

import Foundation

class Model: NSObject, NSCoding {
    var money:[String] = []
    var detail:[String] = []
    
    
    override init(){
    }
    
    func add(firstNum: Double, secondNum: Double) -> Double{
        return (firstNum + secondNum)
    }
    
    func strToDou(element: String) -> Double{
        return (element as NSString).doubleValue

    }
    
    func DouTostr(givenNum: Double) -> String{
        return String(givenNum)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.money, forKey: "money")
        coder.encode(self.detail, forKey: "detail")
    }
    
    required init?(coder: NSCoder) {
        self.money = coder.decodeObject(forKey: "money") as! [String]
        self.detail = coder.decodeObject(forKey: "detail") as! [String]
        
        print("money", coder.decodeObject(forKey: "money") as! [String])
        print("detail", coder.decodeObject(forKey: "detail") as! [String])
     //   self.money.append(coder.decodeObject(forKey: "money") as! Array<String>)
      //  self.detail.append(coder.decodeObject(forKey: "detail") as! Array<String>)
        super.init()
    }
}
