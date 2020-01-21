//
//  PicturesCVC.swift
//  PersistenceLab
//
//  Created by Christian Hurtado on 1/20/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit
import ImageKit

class PicturesCVC: UICollectionViewCell {
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var viewLabel: UILabel!
    @IBOutlet weak var downloadsLabel: UILabel!
    
    @IBOutlet weak var pictureView: UIImageView!
    
    
    func configureCell(for photo: Pictures){
        
        userLabel.text = "User: \(photo.user)"
        userLabel.backgroundColor = .darkGray
        viewLabel.text = "total views \(photo.views.description)"
        viewLabel.backgroundColor = .darkGray
        downloadsLabel.text = "Total Downloads: \(photo.downloads.description)"
        downloadsLabel.backgroundColor = .darkGray
        
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
