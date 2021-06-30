//
//  RecipeDetailVC.swift
//  RecipeApp-TableView
//
//  Created by DCS on 30/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class RecipeDetailVC: UIViewController {

    //@IBOutlet weak var desclbl: UILabel!
    
    //@IBOutlet weak var detailimage: UIImageView!
    
    //@IBOutlet weak var detaillbl: UILabel!
    
    private let Description:UITextView = {
        let textView = UITextView()
 
        textView.textAlignment = .center

        
        return textView
    }()
    private let Name:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return label
    }()
    private let Image:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    var image = UIImage()
    var lbl = ""
    var desc = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        Name.text = lbl
        Image.image = image
        Description.text = desc
        view.addSubview(Name)
        view.addSubview(Description)
        view.addSubview(Image)
        self.view.backgroundColor = .brown
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg3.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Name.frame = CGRect(x: 10, y: 80, width: view.width - 20, height: 20)
        Image.frame = CGRect(x: 10, y: Name.bottom + 2, width: view.width - 20, height: 200)
        Description.frame = CGRect(x: 10, y: Image.bottom + 2, width: view.width - 20, height: view.height - Name.height - Image.height - 20)

    }
}
