//
//  Login.swift
//  RecipeApp-TableView
//
//  Created by DCS on 30/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Login: UIViewController {
    private let lbllogin:UILabel = {
        let label = UILabel()
        label.text = "Sign In Here ..."
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        return label
    }()
    
    private let lblName:UILabel = {
        let lbl1 = UILabel()
        lbl1.text = "Name:"
        lbl1.textAlignment = .center
        lbl1.textColor = .white
        lbl1.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        return lbl1
    }()
    private let txtName:UITextField = {
        let txtname = UITextField()
        txtname.placeholder = "Enter Your Name"
        txtname.textAlignment = .center
        txtname.borderStyle = .roundedRect
        txtname.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        txtname.textColor = .white
        return txtname
    }()
    private let lblPassword:UILabel = {
        let lbl1 = UILabel()
        lbl1.text = "Password:"
        lbl1.textAlignment = .center
        lbl1.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        lbl1.textColor = .white
        return lbl1
    }()
    private let txtPassword:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter Your Password"
        txt.textAlignment = .center
        txt.borderStyle = .roundedRect
        txt.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        txt.textColor = .white
        
        return txt
    }()
    
    private let btnLogin : UIButton = {
        let btn = UIButton()
        btn.setTitle("Continue", for: .normal)
        btn.addTarget(self, action: #selector(handlelogin), for: .touchUpInside)
        btn.backgroundColor = .gray
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        btn.layer.cornerRadius = 25
        return btn
    } ()
    
    
    @objc func handlelogin()
    {
        if (txtName.text == "") {
            let alert = UIAlertController(title: "Oops!", message: "Username is not enter.Please Enter User Name.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
        else if (txtPassword.text == "") {
            let alert = UIAlertController(title: "Oops!", message: "User Password is not enter.Please Enter User Password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
        else if (txtName.text != "Admin") {
            let alert = UIAlertController(title: "Oops!", message: "Username is invalid.Please Enter Correct User Name.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
        else if (txtPassword.text != "Admin") {
            let alert = UIAlertController(title: "Oops!", message: "Password is invalid.Please Enter Correct User Password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
            
        else{
            let vc = TableViewVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lbllogin)
        view.addSubview(lblName)
        view.addSubview(lblPassword)
        view.addSubview(txtName)
        view.addSubview(txtPassword)
        view.addSubview(btnLogin)
        title = "Login"
        self.view.backgroundColor = .brown
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg1.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        lbllogin.frame = CGRect(x: 20, y: 80, width: view.width - 20, height: 40)
        lblName.frame = CGRect(x: 20, y: lbllogin.bottom + 20, width: view.width - 250, height: 40)
        txtName.frame = CGRect(x: lblName.width + 20, y: lbllogin.bottom + 20 , width: view.width -  lblName.width - 40, height: 40)
        lblPassword.frame = CGRect(x: 20,y: lblName.bottom + 20, width: view.width - 250, height: 40)
        txtPassword.frame = CGRect(x:lblPassword.width + 20, y: lblName.bottom + 20, width: view.width - lblPassword.width - 40, height: 40)
        btnLogin.frame = CGRect(x: 20, y: lblPassword.bottom + 20, width: view.width - 40, height: 40)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
