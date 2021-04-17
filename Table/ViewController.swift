//
//  ViewController.swift
//  Table
//
//  Created by 황정호 on 2021/04/12.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    var newsData: Array<Dictionary<String, Any>>?
    
    //1. http 통신 방법
    //2. /json 데이터 형태 {"key":"value"} {["값","값","값"]} 배열형태
    //3. 테이블뷰의 데이터매칭
    // background : network / ui :main
    //api 하루에 500개 무료
    func getNews(){
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=de389344a7c3438a863b209574022d32")!) { (data, response, error) in
            
            if let dataJson = data{
                //json parsing
                do {
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    //Dictionary
                    let articles = json["articles"] as! Array<Dictionary<String, Any>>
                    self.newsData = articles
                    
                    DispatchQueue.main.async {
                        self.TableViewMain.reloadData()
                    }
                    
                    //                        for (idx, value) in articles.enumerated() {
                    //                            if let v = value as? Dictionary<String, Any> {
                    //                                print("\(v["title"])")
                }
                
                catch{}
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Data의 개수
        if let news = newsData{
            return news.count
        }
        else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //어떠한 데이터
        //let cell = UITableViewCell.init(style:.default, reuseIdentifier: "TableCellType1")
        
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        //다시 재생할 수 있는 셀을 정의한다. indexPath 순번에 해당하는 type1을 넣는다.
        
        // as? as! 부모 자식 친자확인
        let idx = indexPath.row
        print("idx :: \(idx)")
        if let news = newsData{
            let row = news[idx]
            print("row :: \(row)")
            if let r = row as? Dictionary<String, Any> {
                print("TITLE :: \(r)")
                if let title = r["title"] as? String{
                    cell.LabelText.text = title
                }
            }
        }
        return cell
        
    }
    //1. 옵션 클릭 감지
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("누른다! \(indexPath.row)")
    }
    
    //2. 쉐그웨이 부모(가나다)- 자식(가나다)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id == segue.identifier, "NewsDetail" == id {
           if let controller == segue.destination as? NewsDetailController{
                controller.imageUrl =
            //여기까지함
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
        getNews()
    }
    
    
}


