//
//  TableViewDataController.swift
//  MVVMContainer
//
//  Created by Omkar khedekar on 27/09/18.
//  Copyright © 2018 Omkar khedekar. All rights reserved.
//

import UIKit

class TableViewDataController: NSObject {

    @IBOutlet var tabelView: UITableView! {
        didSet {
            self.tabelView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentfier")
        }
    }
}

extension TableViewDataController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentfier", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}

extension TableViewDataController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard
            let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        else { return }
        let alert = UIAlertController(title: "", message: "Selected \(indexPath)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        rootViewController.present(alert, animated: true, completion: nil)
    }
}
