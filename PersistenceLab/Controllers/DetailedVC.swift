//
//  DetailedVC.swift
//  PersistenceLab
//
//  Created by Christian Hurtado on 1/20/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit
import ImageKit

class DetailedVC: UIViewController {

    var photo: Pictures?
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var downloadsLabel: UILabel!
    @IBOutlet weak var pictureView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = "User: \(photo?.user ?? "no user")"
        viewsLabel.text = "Views: \(photo?.views.description ?? "500")"
        likesLabel.text = "Likes: \(photo?.likes.description ?? "500")"
        downloadsLabel.text = "Downloads: \(photo?.downloads.description ?? "500")"
        
        pictureView.getImage(with: photo!.largeImageURL) { (result) in
            switch result {
                case .failure:
                    DispatchQueue.main.async {
                        self.pictureView.image = UIImage(systemName: "exclaimationmark-triangle")
                    }
                case .success(let image):
                    DispatchQueue.main.async {
                        self.pictureView.image = image
                    }
            }
        }
    }
    
    @IBAction func favoritesButton(_ sender: UIBarButtonItem) {
    }
    

}

