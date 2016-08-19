# core-data-test

### CoreData setup

#### step1 

* create a project && check use coredata


<br><br>


#### step2

* in <projectname>.xcdatamodeld , add entity (table)
* in entity , add attribute and type. note: image store in binary && select image attribute > attribute, check allow erternal storage






#### step3

* in editor, select "create NSObject management subclass" ,  Xcode create <entity name>.swift  && <entity name + CoreDataProperties>.swift
* note: if you are  image attribute, you have to add get&set func in <entity name>

```swift
    func setRecipeImgage(image: UIImage ) {
        let data = UIImagePNGRepresentation(image)
        self.image = data
    }
    
    func getRecipeImage() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }

```




#### step4

* save entity 

```swift
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
```


#### step5

* fetch entity 

```swift
    
    func fetchAndSetResults(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Recipe")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.recipes = results as! [Recipe]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
```

* addToView 

```swift
 override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableview.reloadData()
    }
```




