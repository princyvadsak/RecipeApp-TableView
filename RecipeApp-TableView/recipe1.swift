//
//  recipe1.swift
//  RecipeApp-TableView
//
//  Created by DCS on 24/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class recipe1: UIViewController {
        
        private var cityState = [Int]()
        
        private let myTableView = UITableView()
        
        private var cityArray = ["Berlin", "Moscow", "Rio", "Tokyo", "Denver", "Helsinki", "Oslo", "Nairobi"]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            title = "Custom Table View"
            
            view.addSubview(myTableView)
            setupTableView()
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            myTableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
        }
    }
    
    extension recipe1 : UITableViewDataSource, UITableViewDelegate {
        
        private func setupTableView() {
            myTableView.dataSource = self
            myTableView.delegate = self
            myTableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cityArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            
            cell.setupCityCellWith(title: cityArray[indexPath.row], index: indexPath.row, and: (cityState.contains(indexPath.row) ? true : false))
            cell.myButton.addTarget(self, action: #selector(openCityDetails), for: .touchUpInside)
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
            let cell = tableView(, cellForRowAt: <#T##IndexPath#>)UITableView
            if !cityState.contains(indexPath.row) {
                cityState.append(indexPath.row)
                cell.animateCell(at: indexPath.row)
            }
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                myTableView.beginUpdates()
                cityArray.remove(at: indexPath.row)
                myTableView.deleteRows(at: [indexPath], with: .fade)
                myTableView.endUpdates()
            }
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
        }
        
        @objc private func openCityDetails(_ sender:UIButton) {
            navigationController?.pushViewController(WebViewController(search: cityArray[sender.tag]), animated: true)
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
