//
//  JobCell.swift
//  JobSearch
//
//  Created by MacX on 5/8/21.
//

import UIKit

class JobCell: UITableViewCell {

    @IBOutlet weak var jobBubble: UIView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var created_at: UILabel!
    
    var buttonAction: ((UITableViewCell) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func applyPressed(_ sender: UIButton) {
        buttonAction?(self)
    }
    
}
