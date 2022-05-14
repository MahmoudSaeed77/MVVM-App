//
//  CategoryCell.swift
//  Medical Shop Client
//
//  Created by apple on 09/05/2022.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func bindCategoryData(data: Categories) {
        self.nameLbl.text = data.name ?? ""
    }
    func bindBrandsData(data: Brands) {
        self.nameLbl.text = data.name ?? ""
    }
}
