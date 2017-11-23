//
//  DBServiceApi+UserDefaults.swift
//  TDDBService
//
//  Created by Yapapp on 16/11/17.
//

import Foundation

extension Dictionary: TDDBServiceAbleObject{}

public struct DBServiceApiUserDefaults: TDDBServiceApi{
    
    public init(){}
    
    public var request: TDDBServiceRequest?
    public var response: AnyObject?
    
    public func call(_ request: TDDBServiceRequest, completionHandler: @escaping TDDBFetchCompletionClosure){
        
    }
}
