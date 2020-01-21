//
//  FavesCell.swift
//  PersistenceLab
//
//  Created by Christian Hurtado on 1/21/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class FavesCell: UITableViewCell {
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var viewLabel: UILabel!
    @IBOutlet weak var downloadsLabel: UILabel!
    @IBOutlet weak var pictureView: UIImageView!
    
    func configureCell(for photo: Pictures){
        userLabel.text = "User: \(photo.user)"
        viewLabel.text = "Views: \(photo.views.description)"
        downloadsLabel.text = "Downloads: \(photo.downloads.description)"
        pictureView.getImage(with: photo.previewURL) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.pictureView.image = UIImage(systemName: "exclaimationmark-triangle")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.pictureView.image = image
                }
                
            }
        }
    }
}
