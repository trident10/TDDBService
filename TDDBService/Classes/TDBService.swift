//
//  DBServiceAble.swift
//  TDDBService
//
//  Created by Yapapp on 14/11/17.
//

import Foundation

public protocol TDBService: class {
    func apiClient() -> TDDBServiceApi
    func entityType() -> TDDBEntity
    func apiCall(_ data:TDDBServiceAbleObject?, methodType: TDDBMethodType, predicate: NSPredicate?, sortDescriptor: [TDDBSortDescriptor]?, completion: @escaping TDDBFetchCompletionClosure)
}

public extension TDBService{
    
    public func apiCall(_ data:TDDBServiceAbleObject?, methodType: TDDBMethodType, predicate: NSPredicate?, sortDescriptor: [TDDBSortDescriptor]?, completion: @escaping TDDBFetchCompletionClosure){
        var configurator = DBServiceConfiguratorClient()
        configurator.dataSource = self
        let result = configurator.createRequest(data, methodType: methodType, predicate: predicate, sortDescriptor: sortDescriptor)
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

