//
//  ToDo.swift
//  TodoSwiftUIDemo
//
//  Created by Shagun Madhikarmi on 12/07/2020.
//  Copyright © 2020 madhikarma. All rights reserved.
//

import Foundation

struct ToDo: Identifiable, CustomStringConvertible {
    let id: Int
    let title: String
    let isFavourite: Bool
    
    var description: String {
        return "\(id) \(title) - \(String(isFavourite))"
    }
}
