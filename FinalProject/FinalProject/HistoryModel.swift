//
//  HistoryModel.swift
//  FinalProject
//
//  Created by Wang, Xinyang on 12/5/18.
//  Copyright © 2018 Wang, Xinyang. All rights reserved.
//

import UIKit

class HistoryModel: NSObject, NSCoding {
    
    var money: String
    var detail: String
    
    override var description: String{
        return self.money + " " + self.detail
    }
    
    init(money:String, detail:String) {
        self.money = money
        self.detail = detail
        super.init()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.money, forKey: "money")
        coder.encode(self.detail, forKey: "detail")
    }
    
    required init?(coder: NSCoder) {
        self.money = coder.decodeObject(forKey: "money") as! String
        self.detail = coder.decodeObject(forKey: "detail") as! String
        super.init()
    }

}
