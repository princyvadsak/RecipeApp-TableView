//
//  ViewController.swift
//  RecipeApp-TableView
//
//  Created by DCS on 30/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let lblcooktime1:UILabel = {
        let label = UILabel()
        label.text = "Hello!!! Foodies..."
        //label.textAlignment = .center
        //label.backgroundColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .brown
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    private let lblcooktime2:UILabel = {
        let label = UILabel()
        label.text = "It`s Time For Cooking"
        //label.textAlignment = .center
        //label.backgroundColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .brown
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    private let lblcooktime3:UILabel = {
        let label = UILabel()
        label.text =  "Let`s Start Fun With Learn Cooking"
        //label.textAlignment = .center
        //label.backgroundColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .brown
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    private let lblcooktime4:UILabel = {
        let label = UILabel()
        label.text =  "500+ Recipes Avilable"
        //label.textAlignment = .center
        //label.backgroundColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .brown
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    
    private let spic:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "r1")
        return imageView
    }()
    private let btnnext : UIButton = {
        let con = UIButton()
        con.setTitle("Let`s Started", for: .normal)
        con.addTarget(self, action: #selector(gotologin), for: .touchUpInside)
        con.backgroundColor = .brown
        con.setTitleColor(.white, for: .normal)
        con.layer.cornerRadius = 25
        return con
    } ()
    @objc func gotologin()
    {
        let vc = Login()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(lblcooktime1)
        view.addSubview(lblcooktime2)
        view.addSubview(lblcooktime3)
        view.addSubview(lblcooktime4)
        view.addSubview(btnnext)
        view.addSubview(spic)
        self.view.backgroundColor = .black
        self.view.backgroundColor = .brown
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg3.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lblcooktime1.frame = CGRect(x: 20, y: 60, width: view.width - 40, height: 40)
        lblcooktime2.frame = CGRect(x: 20, y: lblcooktime1.bottom + 2, width: view.width - 40, height: 50)

        spic.frame = CGRect(x: 0, y: lblcooktime2.bottom + 2, width: view.width, height: 300)
        lblcooktime4.frame = CGRect(x: 20, y: spic.bottom + 2, width: view.width - 40, height: 30)

        lblcooktime3.frame = CGRect(x: 20, y: lblcooktime4.bottom + 2, width: view.width - 40, height: 50)
        btnnext.frame = CGRect(x: 20, y: lblcooktime3.bottom + 20, width: view.width - 40, height: 50)
    }
    
    
}

