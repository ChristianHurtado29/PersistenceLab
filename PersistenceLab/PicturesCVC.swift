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
    
    @IBOutlet weak var picName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    @IBOutlet weak var pictureView: UIImageView!
    
    
    func configureCell(for photo: Pictures){
        
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
