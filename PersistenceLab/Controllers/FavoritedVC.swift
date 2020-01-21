//
//  FavoritedVC.swift
//  PersistenceLab
//
//  Created by Christian Hurtado on 1/21/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class FavoritedVC: UIViewController {
    
    @IBOutlet weak var favTableView: UITableView!
    
    var faves = [Pictures?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFaves()
        favTableView.delegate = self
        favTableView.dataSource = self
    }
    
    func getFaves() {
        do {
            faves = try PersistenceHelper.loadEvents()
        } catch {
            print("load data error")
        }
    }
}

extension FavoritedVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favesCell") as? FavesCell
        guard let fav = faves[indexPath.row] else {
            fatalError("Couldnt indexpath a fave")
        }
        cell?.configureCell(for: fav)
        return cell!
    }
}

extension FavoritedVC: UITableViewDelegate{
    
}
