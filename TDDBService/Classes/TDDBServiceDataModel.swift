//
//  DBServiceDataModel.swift
//  TDDBService
//
//  Created by Yapapp on 16/11/17.
//

import Foundation

public enum TDDBMethodType {
    case fetch
    case insert
    case update
    case delete
}

public protocol TDDBEntity {
}
extension String: TDDBEntity{}

public protocol TDDBServiceAbleObject{
}

enum TDDBServiceError: Error {
    case insertionFailed
    case requestGenerationFailed
}

public struct TDDBSortDescriptor {
    let key: String
    let ascending: Bool
    
    public init(key: String, ascending: Bool = true) {
        self.key = key
        self.ascending = ascending
    }
}

public typealias TDDBFetchCompletionClosure = (TDResult<TDDBServiceAbleObject?, TDError>) -> Void


public struct TDDBServiceRequest{
    public var methodType: TDDBMethodType = .fetch
    public var entity: TDDBEntity?
    public var data: TDDBServiceAbleObject?
    public var sortDescriptor: [TDDBSortDescriptor]?
    public var predicate: NSPredicate?
}
