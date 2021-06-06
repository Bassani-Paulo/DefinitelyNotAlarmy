//
//  ViewController.swift
//  Aprendendo_UIKit
//
//  Created by Paulo Bassani on 30/05/21.
//

import UIKit

class AlarmScreenViewController: UIViewController {
    
    @IBOutlet var alarmTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
    }
}
extension AlarmScreenViewController: UITableViewDelegate{
    
}
extension AlarmScreenViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if indexPath.row == 2 {
            let adCell = alarmTableView.dequeueReusableCell(withIdentifier: "AdCell", for: indexPath) as! AdTableViewCell
            cell = adCell
        } else {
            let alarmCell = alarmTableView.dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath) as! AlarmTableViewCell
            alarmCell.alarmTime.text = "04:30"
            cell = alarmCell
        }
        return cell
    }
    
}
