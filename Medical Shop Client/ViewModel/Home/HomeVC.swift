//
//  HomeVC.swift
//  Medical Shop Client
//
//  Created by apple on 09/05/2022.
//

import UIKit
import Kingfisher

class HomeVC: UIViewController {
    
    
    // MARK:- Outlets
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var categoriesCV: UICollectionView!
    @IBOutlet weak var latestProductsCV: UICollectionView!
    @IBOutlet weak var offersCV: UICollectionView!
    @IBOutlet weak var brandsCV: UICollectionView!
    
    @IBOutlet var collections: [UICollectionView]!
    
    // MARK:- Variables
    var viewModel: HomeViewModel!
    
    // MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = HomeViewModel(view: self)
        self.configCollections()
    }
    
    
    // MARK:- Collection functions
    private func configCollections() {
        self.collections.forEach { collection in
            collection.delegate = self
            collection.dataSource = self
        }
    }
    
    // MARK:- UI Functions
    func successfullFetchingData(data: HomeBaseModel) {
        self.collections.forEach { collection in
            collection.reloadData()
        }
    }
    func failedFetchingData(error: String) {
        // Show alert with error message
        self.alert(success: false, withImage: true, message: error, completion: {})
    }
}
