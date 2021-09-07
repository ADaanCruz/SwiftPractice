//
//  InterestTableViewCell.swift
//  Practice
//
//  Created by Adán Cruz on 10/08/21.
//

import UIKit
import Kingfisher

class InterestTableViewCell: UITableViewCell {

    @IBOutlet weak var ivIcon: UIImageView!
    @IBOutlet weak var lblTopic: UILabel!
    
    public var onClicked: (() -> Void)!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            onClicked()
        }
    }
    
    public func setupFor(data interest: Interest) {
        let url = URL(string: interest.topic.imageURL)
        ivIcon.kf.setImage(with: url)
        lblTopic.text = interest.topic.name
    }
    
}
