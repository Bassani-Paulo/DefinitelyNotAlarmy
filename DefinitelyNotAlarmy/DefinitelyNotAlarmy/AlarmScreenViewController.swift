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
        return Int.random(in: 5...8)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if indexPath.row == 2 {
            let adCell = alarmTableView.dequeueReusableCell(withIdentifier: "AdCell", for: indexPath) as! AdTableViewCell
            cell = adCell
        } else {
            let alarmCell = alarmTableView.dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath) as! AlarmTableViewCell
            alarmCell.alarmTime.text = "\(Int.random(in: 0...1))\(Int.random(in: 0...9)):\(Int.random(in: 0...5))\(Int.random(in: 0...9))"
            alarmCell.setWeekDays(sun: Bool.random(), mon: Bool.random(), tue: Bool.random(), wed: Bool.random(), thu: Bool.random(), fri: Bool.random(), sat: Bool.random())
            cell = alarmCell
        }
        return cell
    }
    
    
    
}
