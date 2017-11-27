//
//  DBServiceApi.swift
//  TDDBService
//
//  Created by Yapapp on 16/11/17.
//

import Foundation

public protocol TDDBServiceApi{
    var request: TDDBServiceRequest? {get set}
    func call(_ request: TDDBServiceRequest, completionHandler: @escaping TDDBFetchCompletionClosure)
}
