//
//  ServiceMock.swift
//  StarWars
//
//  Created by Ratul Chhibber on 17/09/20.
//  Copyright © 2020 Ratul Chhibber. All rights reserved.
//

import Foundation

class ServiceMock {
    
    static func getJsonAsData(filename: String) -> Data {
        
        guard let path = Bundle(for: self).path(forResource: filename, ofType: "json") else {
            fatalError("Invalid file name")
        }
        var data = Data()
        do {
            data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return data
        } catch {
            // handle error
        }
        return data
    }
}
