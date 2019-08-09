//
//  Record.swift
//  CoreDataDemo
//
//  Created by Shagun Madhikarmi on 10/05/2018.
//  Copyright © 2018 ustwo. All rights reserved.
//
//

import Foundation
import CoreData

public class Record: NSManagedObject {

    static let EntityName = "Record"
    @NSManaged public var name: String?
}
