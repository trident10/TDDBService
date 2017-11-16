//
//  DBServiceConfigurator.swift
//  TDDBService
//
//  Created by Yapapp on 16/11/17.
//

import Foundation

public protocol DBServiceConfigurator{
    var dataSource: DBServiceAble? {set get}
    func createRequest() -> TDResult<DBServiceRequest, TDError>
}

public struct DBServiceConfiguratorClient: DBServiceConfigurator{
    
    public init(){}
    
    public var dataSource: DBServiceAble?
    
    public func createRequest() -> TDResult<DBServiceRequest, TDError>{
        if dataSource == nil{
            return TDResult.Error(TDError.init(DBServiceError.requestGenerationFailed))
        }
        var request = DBServiceRequest()
        return TDResult.init(value: request)
    }
    
    public func getApi()-> DBServiceApi{
        return (dataSource?.apiClient())!
    }
    
}

