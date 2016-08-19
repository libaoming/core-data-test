//
//  CreateRecipeVC.swift
//  recipes
//
//  Created by 李宝明 on 16/8/19.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeDesc: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var addRecipeBtn: UIButton!
    
    
    var imgPicker: UIImagePickerController!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        
        recipeImg.layer.cornerRadius = 2.0
        recipeImg.clipsToBounds = true

    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        recipeImg.image = image

    }

    
    @IBAction func addImage(sender: AnyObject!) {
        
        presentViewController(imgPicker, animated: true, completion: nil)
        
    }
    
    @IBAction func createRecipe(sender: AnyObject!){
        
        if let title = recipeTitle.text where recipeTitle.text != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            
            let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
            
            recipe.title = self.recipeTitle.text
            recipe.ingredients = self.recipeDesc.text
            recipe.steps = self.recipeSteps.text
            recipe.setRecipeImgage(self.recipeImg.image!)
            
        
            context.insertObject(recipe)
            
            do {
                try context.save()
            }catch let err as NSError {
                print(err.debugDescription)
            }
            
            self.navigationController?.popViewControllerAnimated(true)
            
        }
        
    }

    
}
