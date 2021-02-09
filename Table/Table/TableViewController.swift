//
//  TableViewController.swift
//  Table
//
//  Created by 이민우 on 2021/02/09.
//

import UIKit

// 변수 선언을 class 정의 전에 하여야 한다. (그래야 다른 컨트롤러에서 공유해서 쓸 수 있다.)
var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Edit 버튼을 만들고 삭제 기능 추가하기, 왼쪽으로 배치
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    // 보통은 테이블안에 섹션이 1개 (한 뭉치가 한 섹션)
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // 섹션당 열의 개수는 item의 개수 (DB에서 가져온 데이터 개수)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    // Cell의 구성 정의
    // withIdentifier => tableView 정의한 identifier
    // IndexPath => row 번호
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])

        return cell
    }
    
    // Table View에 추가된 내용 불러 들이기 (viewWillAppear은 viewdidload와 달리 계속해서 화면에 들어올 떄마다 갱신)
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // Delete를 삭제로 보이기
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // 이동할 item의 위치
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        // 이동할 image의 위치
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        // 이동할 item을 삭제
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        // 이동할 image를 삭제
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        // itesm 삽입
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        // imageFile 삽입
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell // 클릭한 셀의 정보를 가져옴
            let indexPath = self.tvListView.indexPath(for: cell) // 클릭한 셀의 index
            let detailView = segue.destination as! DetailViewController // 데이터 보낼 컨트롤러 설정
            
            detailView.receiveItem = items[(indexPath! as NSIndexPath).row]
        }
    }
  

}
