//
//  QpickDecoder.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2023/02/06.
//

import Foundation

class QpickDecoder : JSONDecoder {
    
    override init() {
        super.init()
    }
    
    func decode<T>(_ type: T.Type, from: Any?) throws -> T where T: Decodable {
        let data = from as! Data
        return try self.decode(type, from: data)
    }
}
