//
//  MainViewController.swift
//  Practice
//
//  Created by Adán Cruz on 10/08/21.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: View Outlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tvInterest: UITableView!
    
    // MARK: Vars and consts
    private var interest: [Interest] = []
    public var flag: Bool = false
    
    // MARK: General Setups
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tvInterest.register(
            UINib(nibName: "InterestTableViewCell", bundle: nil),
            forCellReuseIdentifier: "InterestTableViewCell")
        tvInterest.delegate = self
        tvInterest.dataSource = self
    }
    
    // MARK: Fetches data
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    private func fetchData() {
        // Show progress dialog
        Interest.fetchInterest { interest in
            // Hide progress dialog
            
            if interest == nil {
                // Show error dialog
                return
            }
            
            self.interest = interest!
            self.tvInterest.reloadData()
        }
    }

}

// MARK: UITableView protocols
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "InterestTableViewCell",
            for: indexPath) as! InterestTableViewCell
        
        cell.onClicked = {
//            let item = self.interest[indexPath.row]
            
            let vc = UIStoryboard(
                name: "Skeleton",
                bundle: nil).instantiateViewController(
                    withIdentifier: "SkeletonViewController") as! SkeletonViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        cell.setupFor(data: interest[indexPath.row])
        
        return cell
    }
    
}
