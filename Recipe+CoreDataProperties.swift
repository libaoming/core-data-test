//
//  Recipe+CoreDataProperties.swift
//  recipes
//
//  Created by 李宝明 on 16/8/19.
//  Copyright © 2016年 李宝明. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Recipe {

    @NSManaged var image: NSData?
    @NSManaged var ingredients: String?
    @NSManaged var steps: String?
    @NSManaged var title: String?

}
