//
//  ProductCell.swift
//  Medical Shop Client
//
//  Created by apple on 09/05/2022.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var favoriteBtn: UIButton!
    @IBOutlet weak var productImgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var discountPriceLbl: UILabel!
    @IBOutlet weak var originalPriceLbl: UILabel!
    @IBOutlet weak var addToCartBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func bindProductData(data: Product) {
        self.productImgView.kf.setImage(with: URL(string: data.images?.first ?? ""))
        self.nameLbl.text = data.name ?? ""
        self.configPriceLbls(discount: data.discount_price ?? "", original: data.price ?? "")
    }
    fileprivate func configPriceLbls(discount: String, original: String) {
        if discount == "" {
            self.discountPriceLbl.isHidden = true
        }
        self.discountPriceLbl.text = "\(discount) \(Constants.currency)"
        self.originalPriceLbl.text = "\(original) \(Constants.currency)"
    }
}
