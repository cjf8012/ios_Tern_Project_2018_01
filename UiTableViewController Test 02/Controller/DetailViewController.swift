//
//  DetailViewController.swift
//  UiTableViewController Test 02
//
//  Created by D7703_04 on 2018. 5. 28..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {

    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var cellImageView: UIImageView!
    
    var cellImage: String = ""
    var name: String = ""
    var local1: String = ""
    var tel1: String = ""
    var menu: String = ""
    var type: String = ""
    var index = 1
    var back = 1
    
    @IBAction func nextButton(_ sender: Any) {
        if index == 3 {
            back = 0
        } else if index == 1{
            back = 1
        }
        if back == 1 {
            index += 1
        } else if back == 0{
            index = index - 1
        }
        cellImageView.image = UIImage(named: "토마토\(index).jpeg")
        //업데이트 버튼 누를시 카운터가 1씩 증가하고 이미지가 바뀌며 3에 달했을때 -1씩 깍이게 되면서 이미지가 돌아 가면서 다시 바뀐다.
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // delegate connection
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        cellImageView.image = UIImage(named: cellImage)
        self.title = name
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.text = "주소 : " + local1
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.text = "전화번호 : " + tel1
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.text = "메뉴 : " + menu
            return cell
        default :
            let cell = tableView.dequeueReusableCell(withIdentifier: "mapCell", for: indexPath) as! MapTableViewCell
            cell.configure(location: local1)
            return cell
        }
    } 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailMapView" {
            if detailTableView.indexPathForSelectedRow != nil {
                let destinationController = segue.destination as! MapViewController
                destinationController.location = local1
                destinationController.name = name
                destinationController.tel = tel1
            }
        }
        
    }

}

