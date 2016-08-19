//
//  RecipeCell.swift
//  recipes
//
//  Created by 李宝明 on 16/8/19.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(recipe: Recipe){
        
        self.recipeTitle.text = recipe.title
        self.recipeImg.image = recipe.getRecipeImage()
        
    }
  
}
