//
//  ViewController.swift
//  Table
//
//  Created by 황정호 on 2021/04/12.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //Data의 개수
    return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //어떠한 데이터
        let cell = UITableViewCell.init(style:.default, reuseIdentifier: "TableCellType1")
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
    }


}

