//
//  SearchService.swift
//  Search
//
//  Created by Shagun Madhikarmi on 13/04/2020.
//  Copyright © 2020 Shagun Madhikarmi. All rights reserved.
//

import Foundation

public protocol SearchService {
    public func executeSearch(term: String) -> Result<[String], Error> {
        return .success([term])
    }
}
