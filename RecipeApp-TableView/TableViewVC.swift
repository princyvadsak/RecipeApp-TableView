//
//  TableViewVC.swift
//  RecipeApp-TableView
//
//  Created by DCS on 30/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class TableViewVC: UIViewController {
    
    var tableView = UITableView()
    var recipeArr = ["Pizza", "Burger","Frankie","Pasta","Pancakes"]
    var recipeDesc = ["Step 1: Getting Started    Start with a medium bowl that's been lightly coated with olive oil. Add warm water (about 110 degrees F), dry yeast and sugar. Note: The activated yeast feeds on the sugar and makes the dough rise. In another bowl, combine flour and salt. Have a fork, cutting board, knife, pizza pan and rolling pin (optional) handy.Step 2: Make a Well in the Center of the Dough In the bowl containing the flour and salt, make a well in the center and add the yeast. Tip: If the yeast doesn't foam, check the expiration date and water temperature (should be approximately 110 degrees F). Add the olive oil. Use a fork to pull the dry into the wet, then mix.   Step 3: Knead the Dough     When the dough starts to come together, get in there with your hands and knead it for a few minutes on a lightly floured board. Use the heel of your hand to push the dough down and forward. Give it a few turns. You're done when the dough is a little tacky.Step 4: Cover the Dough in Plastic Wrap Place the kneaded dough into the oiled bowl, cover with plastic wrap and let it rise in a warm spot until it doubles in size. Tip: Chart the progress of the rising dough by using a marker on the plastic wrap to circle the size of the ball of dough at the beginning of the process. It can take anywhere from 1 to 2 hours for the dough to rise, depending on the recipe and ambient temperature.Step 5: Shape the Dough Sprinkle a pizza pan with a little semolina for good separation and a nutty crunch. Place a ball of dough in the center of the pan and spread it out, using a rolling pin or your hands. Spin it. Pull the dough to the edges of the pan to thin out the center. Add some more semolina for better separation. Make sure the thickness is even.  step 6: top the pizz and back it for 3 minutes","Step 1 Pressure cook carrots, peas and corn    To make the burger patty, pressure cook the carrot, peas and sweet corn for 1 whistle or until soft.    Step 2 Add the spices    Add the cooked vegetables, chopped onions, red chilli powder, lemon juice, garam masala powder, salt and ginger-garlic paste to a large bowl.Step 3 Add mashed potatoes    Add lemon juice and mashed potatoes in the bowl, mix well until evenly combined. Shape the mixture into small/medium patties.    Step 4 Shallow fry the patties    Now heat oil in a pan over medium flame. Roll the prepared patties in the breadcrumbs and shallow fry until golden brown on both sides.    Step 5 Keep aside    Remove and keep aside.Step 6 Prepare the burger    Take one half of the burger bun. Spread some butter and place the lettuce on top.    Step 7 Add slices onions, cucumber and tomatoesPlace the prepared vegetable patty on top. Top up with slices of onion, tomato, cucumber and cheese. If you want to make it even more delicious and healthy replace cheese with eggless mayonnaise.Step 8 Burger is ready   Cover it with the other half of the burger bun. If desired, add some ketchup on top. Secure it with a toothpick if desired.","This delicious frankie recipe is a snack that everyone will enjoy and is a popular vegetarian street food option across India. While there are many variants of this snack, I share a tasty vegetarian version of thin, soft wheat roti stuffed with crispy Aloo Tikki (potato patties), grated carrots, onions and yogurt raita."," Pasta Recipes- It's impossible to think of Italian food without a warm plate of pasta and some great wine. Made with flour, pasta can be formed into sheets, strips or any other shape. In fact, you'll find over 600 pasta shapes across the globe. The famous Italian dish - pasta is one of the best comfort meals. It is a no-fuss dish that can be ready in minutes and does not require genius cooking skills.  This simple dish offers a lot of room for creativity. You can experiment with pasta recipes using different kinds of pastas like fusilli, penne or spaghetti, different sauces such as tomato sauce, creamy white sauce or the meaty bolognese and a huge variety of ingredients ranging from herbs to veggies and cheese.Easy Pasta Recipes- It's impossible to think of Italian food without a warm plate of pasta and some great wine. Made with flour, pasta can be formed into sheets, strips or any other shape. In fact, you'll find over 600 pasta shapes across the globe. The famous Italian dish - pasta is one of the best comfort meals. It is a no-fuss dish that can be ready in minutes and does not require genius cooking skills.  This simple dish offers a lot of room for creativity. You can experiment with pasta recipes using different kinds of pastas like fusilli, penne or spaghetti, different sauces such as tomato sauce, creamy white sauce or the meaty bolognese and a huge variety of ingredients ranging from herbs to veggies and cheese.","in pancake add sugar ,allpurpose flour,bakingsoda,backingpowder,milk and butter then mix well better and then back on pan"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipes"
        setTableView()
        view.backgroundColor = UIColor.white
        self.view.backgroundColor = .brown
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg3.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setTableView(){
        tableView.frame = self.view.frame
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = UIColor.clear
        self.view.addSubview(tableView)
        
        tableView.register(ReceipeCell.self, forCellReuseIdentifier: "RecipeCell")
    }
    
    
    
}


extension TableViewVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! ReceipeCell
        
        cell.userImage.image = UIImage(named: recipeArr[indexPath.row])
        cell.namelbl.text = recipeArr[indexPath.row]
        //        cell.descriptionlbl.text = recipeDesc[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //if let vc = storyboard.instantiateViewController(withIdentifier: "RecipeDetailVC") as? RecipeDetailVC{
            let vc = RecipeDetailVC()
            vc.desc = recipeDesc[indexPath.row]
            vc.image = UIImage(named: recipeArr[indexPath.row])!
            vc.lbl = recipeArr[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        let ip = tableView.indexPathForSelectedRow
    //        let dvc = segue.destination as! DetailVCViewController
    //        dvc.image = UIImage(named: recipeArr[ip!.row])!
    //        dvc.lbl = recipeArr[(ip?.row)!]
    //    }
    
}
