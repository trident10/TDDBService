//
//  DBServiceApi+UserDefaults.swift
//  TDDBService
//
//  Created by Yapapp on 16/11/17.
//

import Foundation

public struct DBServiceApiUserDefaults: DBServiceApi{
    
    public init(){}
    
    public var request: DBServiceRequest?
    public var response: AnyObject?
    
    public func call(_ request: DBServiceRequest, completionHandler: @escaping DBFetchCompletionClosure){
        
    }
}
