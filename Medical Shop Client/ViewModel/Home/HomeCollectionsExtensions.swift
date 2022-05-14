//
//  HomeCollectionsExtensions.swift
//  Medical Shop Client
//
//  Created by apple on 09/05/2022.
//

import UIKit

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // do what you want when user tapped a cell
        print(indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Specify cell size for each collection
        switch collectionView {
        case  self.categoriesCV:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        case self.latestProductsCV:
            return CGSize(width: (self.view.frame.width) / 3, height: collectionView.frame.height)
        case self.offersCV:
            return CGSize(width: (self.view.frame.width) / 3, height: collectionView.frame.height)
        case self.brandsCV:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        default:
            return CGSize()
        }
    }
}
extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Specify cell count depending data from api
        switch collectionView {
        case  self.categoriesCV:
            return self.viewModel.getCategoriesCount()
        case self.latestProductsCV:
            return self.viewModel.getNewerCount()
        case self.offersCV:
            return self.viewModel.getOffersCount()
        case self.brandsCV:
            return self.viewModel.getBrandsCount()
        default:
            return Int()
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Binding data to cells depending on data from api
        switch collectionView {
        case  self.categoriesCV:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.categoryCell, for: indexPath) as! CategoryCell
            cell.bindCategoryData(data: self.viewModel.bindCategoriesData()[indexPath.item])
            return cell
        case self.latestProductsCV:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.productCell, for: indexPath) as! ProductCell
            cell.bindProductData(data: self.viewModel.bindNewerData()[indexPath.item])
            return cell
        case self.offersCV:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.productCell, for: indexPath) as! ProductCell
            cell.bindProductData(data: self.viewModel.bindOffersData()[indexPath.item])
            return cell
        case self.brandsCV:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.categoryCell, for: indexPath) as! CategoryCell
            cell.bindBrandsData(data: self.viewModel.bindBrandsData()[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
