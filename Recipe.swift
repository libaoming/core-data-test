//
//  Recipe.swift
//  recipes
//
//  Created by 李宝明 on 16/8/19.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Recipe: NSManagedObject {


    func setRecipeImgage(image: UIImage ) {
        let data = UIImagePNGRepresentation(image)
        self.image = data
    }
    
    func getRecipeImage() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }
}
