//
//  AlarmTableViewCell.swift
//  Aprendendo_UIKit
//
//  Created by Paulo Bassani on 02/06/21.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    @IBOutlet weak var alarmTime: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    
    @IBOutlet weak var sundayView: UILabel!
    @IBOutlet weak var mondayView: UILabel!
    @IBOutlet weak var tuesdayView: UILabel!
    @IBOutlet weak var wednsdayView: UILabel!
    @IBOutlet weak var thursdayView: UILabel!
    @IBOutlet weak var fridayView: UILabel!
    @IBOutlet weak var saturdayView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0))
    }
    @IBAction func alarmSwitch(_ sender: UISwitch) {
        if self.cellView.alpha == 0.75 {
            cellView.alpha = 1
        } else{
            cellView.alpha = 0.75
            
        }
    }
    
    func setWeekDays(sun: Bool, mon: Bool, tue: Bool, wed:Bool, thu: Bool, fri: Bool, sat: Bool) {
        let not:CGFloat = 0.25
        let yep:CGFloat = 1
        if sun {
            sundayView.alpha = yep
        } else {
            sundayView.alpha = not
        }
        if mon {
            mondayView.alpha = yep
        } else {
            mondayView.alpha = not
        }
        if tue {
            tuesdayView.alpha = yep
        } else {
            tuesdayView.alpha = not
        }
        if wed {
            wednsdayView.alpha = yep
        } else {
            wednsdayView.alpha = not
        }
        if thu {
            thursdayView.alpha = yep
        } else {
            thursdayView.alpha = not
        }
        if fri {
            fridayView.alpha = yep
        } else {
            fridayView.alpha = not
        }
        if sat {
            saturdayView.alpha = yep
        } else {
            saturdayView.alpha = not
        }
    }
    
}
