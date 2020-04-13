//
//  Search.swift
//  Search
//
//  Created by Shagun Madhikarmi on 13/04/2020.
//  Copyright © 2020 Shagun Madhikarmi. All rights reserved.
//

import Foundation

public class Search {
    
    public init() {
        
    }
    public func executeSearch(term: String) -> Result<[String], Error> {
        return .success([term])
    }
}
