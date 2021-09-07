//
//  SkeletonTableViewCell.swift
//  Practice
//
//  Created by Adán Cruz on 07/09/21.
//

import UIKit

class SkeletonTableViewCell: UITableViewCell {

    @IBOutlet weak var imgNumber: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupSkeleton()
    }
    
    private func setupUI() {
        let radius = imgNumber.frame.height / 2
        imgNumber.layer.cornerRadius = radius
    }
    
    private func setupSkeleton() {
        for element in [
            imgNumber,
            lblTitle,
            lblBody
        ] {
            element!.isSkeletonable = true
            if let label = element as? UILabel {
                label.linesCornerRadius = 8
            }
            element!.showAnimatedGradientSkeleton()
        }
    }
    
    public func setupFor(_ index: Int, text: String) {
        imgNumber.image = UIImage(systemName: "\(index + 1).circle.fill")
        lblTitle.text = "Título: \(text)"
        lblBody.text = "Descripción: \(text)"
        
        stopSkeleton()
    }
    
    private func stopSkeleton() {
        for element in [
            imgNumber,
            lblTitle,
            lblBody
        ] {
            element!.hideSkeleton()
        }
    }
    
}
