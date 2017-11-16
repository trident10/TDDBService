//
//  DBServiceDataModel.swift
//  TDDBService
//
//  Created by Yapapp on 16/11/17.
//

import Foundation

public enum DBMethodType {
    case fetch
    case insert
    case update
    case delete
}

public struct DBEntity {
    
    public init(name: String){
        self.name = name
    }
    
    public var name: String
}

public protocol DBServiceAbleObject{
}

enum DBServiceError: Error {
    case insertionFailed
    case requestGenerationFailed
}

public struct DBSortDescriptor {
    let key: String
    let ascending: Bool
    
    public init(key: String, ascending: Bool = true) {
        self.key = key
        self.ascending = ascending
    }
}

public typealias DBFetchCompletionClosure = (TDResult<DBServiceAbleObject?, TDError>) -> Void


public struct DBServiceRequest{
    public var methodType: DBMethodType = .fetch
    public var entity: DBEntity = DBEntity(name: "")
    public var data:DBServiceAbleObject?
    public var sortDescriptor = DBSortDescriptor.init(key: "")
}
