//
//  DBServiceAble.swift
//  TDDBService
//
//  Created by Yapapp on 14/11/17.
//

import Foundation

public protocol DBServiceAble {
    func apiClient() -> DBServiceApi
    func entityType() -> DBEntity
    func apiCall(_ data:DBServiceAbleObject?, methodType: DBMethodType, predicate: NSPredicate?, sortDescriptor: [DBSortDescriptor]?, completion: @escaping DBFetchCompletionClosure)
}

public extension DBServiceAble{
    
    public func apiCall(_ data:DBServiceAbleObject?, methodType: DBMethodType, predicate: NSPredicate?, sortDescriptor: [DBSortDescriptor]?, completion: @escaping DBFetchCompletionClosure){
        var configurator = DBServiceConfiguratorClient()
        configurator.dataSource = self
        let result = configurator.createRequest()
        switch result {
        case .Success(let dBServiceRequest):
            let api = configurator.getApi()
            api.call(dBServiceRequest) { (result) in
                completion(result)
            }
            
        case .Error(let error):
            completion(TDResult.Error(error))
        }
    }
}

