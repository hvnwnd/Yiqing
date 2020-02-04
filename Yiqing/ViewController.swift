//
//  ViewController.swift
//  Yiqing
//
//  Created by Bin CHEN on 2/4/20.
//  Copyright © 2020 Fantestech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    var list: [Locality] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reload), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        reload()
    }
    
    @objc func reload() {
        tableView.refreshControl?.beginRefreshing()
        APIClient.shared.request { [unowned self](list) in
            DispatchQueue.main.async {
                self.list = list
                self.tableView.reloadData()
                self.tableView.refreshControl?.endRefreshing()
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocalityCell") as? LocalityCell else { fatalError() }
        let locality = list[indexPath.row]
        
        cell.configure(locality)
        
        return cell
    }

}
