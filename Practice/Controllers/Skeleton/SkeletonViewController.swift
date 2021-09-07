//
//  SkeletonViewController.swift
//  Practice
//
//  Created by Adán Cruz on 06/09/21.
//

import UIKit
import SkeletonView

class SkeletonViewController: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblSite: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var textData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
        setupSkeleton()
    }
    
    private func setupTableView() {
        tableView.register(
            UINib(nibName: "SkeletonTableViewCell", bundle: nil),
            forCellReuseIdentifier: "SkeletonTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupUI() {
        let radius = imgProfile.frame.height / 2
        imgProfile.layer.cornerRadius = radius
        imgProfile.layer.borderColor = UIColor.systemBlue.cgColor
        imgProfile.layer.borderWidth = 2
    }
    
    private func setupSkeleton() {
        for element in [
            imgProfile,
            lblUsername,
            lblEmail,
            lblSite
        ] {
            element!.isSkeletonable = true
            if let label = element as? UILabel {
                label.linesCornerRadius = 8
            }
            // Animate Skeleton
            element!.showAnimatedGradientSkeleton()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchData()
    }
    
    private func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loadData()
            self.stopSkeleton()
        }
    }
    
    private func loadData() {
        imgProfile.image = UIImage(named: "letter-d")
        lblUsername.text = "Adán Cruz"
        lblEmail.text = "daan@test.com"
        lblSite.text = "https://daan.com"
        
        for index in 1...20 {
            textData.append("Elemento #\(index)")
        }
        tableView.reloadData()
    }
    
    private func stopSkeleton() {
        for element in [
            imgProfile,
            lblUsername,
            lblEmail,
            lblSite,
        ] {
            element?.hideSkeleton()
        }
    }
}

extension SkeletonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textData.isEmpty ? 15 : textData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "SkeletonTableViewCell",
            for: indexPath) as! SkeletonTableViewCell
        
        if textData.indices.contains(indexPath.row) {
            cell.setupFor(indexPath.row, text: textData[indexPath.row])
        }
        
        return cell
    }
    
}
