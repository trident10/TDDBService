//
//  DBServiceApi.swift
//  TDDBService
//
//  Created by Yapapp on 16/11/17.
//

import Foundation

public protocol DBServiceApi{
    var request: DBServiceRequest? {get set}
    var response: AnyObject? {get set}
    func call(_ request: DBServiceRequest, completionHandler: @escaping DBFetchCompletionClosure)
}
