//
//  DBServiceConfigurator.swift
//  TDDBService
//
//  Created by Yapapp on 16/11/17.
//

import Foundation

public protocol TDDBServiceConfigurator{
    var dataSource: TDBService? {set get}
    func createRequest(_ data:TDDBServiceAbleObject?, methodType: TDDBMethodType, predicate: NSPredicate?, sortDescriptor: [TDDBSortDescriptor]?) -> TDResult<TDDBServiceRequest, TDError>
}

public struct DBServiceConfiguratorClient: TDDBServiceConfigurator{
    
    public init(){}
    
    public weak var dataSource: TDBService?
    
    public func createRequest(_ data:TDDBServiceAbleObject?, methodType: TDDBMethodType, predicate: NSPredicate?, sortDescriptor: [TDDBSortDescriptor]?) -> TDResult<TDDBServiceRequest, TDError>{
        if dataSource == nil{
            return TDResult.Error(TDError.init(TDDBServiceError.requestGenerationFailed, code: nil, description: "DBServiceConfiguratorClient dataSource not assigned"))
        }
        var request = TDDBServiceRequest()
        let entity = dataSource?.entityType()
        if entity == nil{
            return TDResult.Error(TDError.init(TDDBServiceError.requestGenerationFailed, code: nil, description: "Data Entity Type not defined"))
        }
        request.entity = entity!
        request.data = data
        request.methodType = methodType
        request.predicate = predicate
        request.sortDescriptor = sortDescriptor
        return TDResult.init(value: request)
    }
    
    public func getApi()-> TDDBServiceApi{
        return (dataSource?.apiClient())!
    }
    
}

