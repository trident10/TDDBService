//
//  ViewController.swift
//  TDDBService
//
//  Created by trident10 on 11/16/2017.
//  Copyright (c) 2017 trident10. All rights reserved.
//

import UIKit
import TDDBService

class ViewController: UIViewController {

    var test: Test = Test()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test.call(data: nil, methodType: .insert, predicate: nil, sortDescriptor: nil) { (result) in
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

struct User: TDDBServiceAbleObject{
    
}



class Test: TDBService{
    func apiClient() -> TDDBServiceApi {
        return DBServiceApiUserDefaults()
    }
    
    func entityType() -> TDDBEntity {
        return "Test"
    }
    
    func call(data:Dictionary<String, AnyObject>?, methodType: TDDBMethodType, predicate: NSPredicate?, sortDescriptor: [TDDBSortDescriptor]?, completion:((TDResult<User, TDError>)-> Void)?){
        
        apiCall(data, methodType: methodType, predicate: predicate, sortDescriptor: sortDescriptor) { (result) in
            
        }
    }
    
}
