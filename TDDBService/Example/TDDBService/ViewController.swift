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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


class Test: DBServiceAble{
    func apiClient() -> DBServiceApi {
        return DBServiceApiUserDefaults()
    }
    
    func entityType() -> DBEntity {
        return DBEntity(name: "Test")
    }
    
}
