//
//  TableViewCell.swift
//  RecipeApp-TableView
//
//  Created by DCS on 24/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
        private let myImageView:UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 40
            imageView.alpha = 0
            imageView.clipsToBounds = true
            return imageView
        }()
        
        private let myLabel:UILabel = {
            let label = UILabel()
            label.font = .boldSystemFont(ofSize: 28)
            return label
        }()
        
        public let myButton:UIButton = {
            let button = UIButton()
            //button.setImage(UIImage(systemName: "search"), for: .normal)
            button.tintColor = .black
            button.alpha = 0
            return button
        }()
        
        func setupCityCellWith(title name:String, index:Int, and state:Bool) {
            
            myImageView.image = UIImage(named: name)
            myLabel.text = name
            myButton.tag = index
            
            setupUI(at: index, with: state)
        }
        
        private func setupUI(at index:Int, with state:Bool) {
            contentView.addSubview(myImageView)
            contentView.addSubview(myLabel)
            contentView.addSubview(myButton)
            
            myImageView.frame = CGRect(x: 20, y: 10, width: 80, height: 80)
            
            if state {
                myLabel.frame = CGRect(x: myImageView.right + 20, y: 10, width: 140, height: 80)
                myImageView.alpha = 1
                myButton.alpha = 1
            } else {
                myLabel.frame = CGRect(x: 20, y: 10, width: 140, height: 80)
                myImageView.alpha = 0
                myButton.alpha = 0
            }
            
            myButton.frame = CGRect(x: contentView.width - 80, y: 10, width: 40, height: 80)
        }
        
        func animateCell(at index:Int) {
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear) {
                self.myImageView.transform = self.myImageView.transform.rotated(by: .pi)
                self.myImageView.alpha = 0.5
                self.myButton.alpha = 0.5
                
                self.myLabel.frame.origin.x = self.myImageView.right + 20
            }
            completion: { _ in
                UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear) {
                    self.myImageView.transform = self.myImageView.transform.rotated(by: .pi)
                    self.myImageView.alpha = 1
                    self.myButton.alpha = 1
                }
            }
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
