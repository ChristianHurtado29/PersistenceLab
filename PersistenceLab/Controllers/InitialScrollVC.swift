//
//  ViewController.swift
//  PersistenceLab
//
//  Created by Christian Hurtado on 1/19/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class InitialScrollVC: UIViewController {
    
    @IBOutlet weak var photoSearch: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchQuery = "united" {
        didSet{
        searchBarQuery(for: searchQuery)
        }
    }
    
    var photos = [Hits](){
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }


func searchBarQuery(for search: String) {
    PicturesAPI.loadPictures(for: search, completion: {[weak self] (result) in
    switch result {
    case .failure( let appError ):
        print("Error \(appError)")
    case .success( let photos):
        self?.photos = photos
       dump(photos)
        }
})
}
}

extension InitialScrollVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        searchQuery = photoSearch.text ?? "yellow"
    }
}
