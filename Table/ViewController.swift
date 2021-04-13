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
    return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //어떠한 데이터
        //let cell = UITableViewCell.init(style:.default, reuseIdentifier: "TableCellType1")
        
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        //다시 재생할 수 있는 셀을 정의한다. indexPath 순번에 해당하는 type1을 넣는다.
        
        // as? as! 부모 자식 친자확인
        
        cell.LabelText.text = "\(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("누른다! \(indexPath.row)")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
    }


}

