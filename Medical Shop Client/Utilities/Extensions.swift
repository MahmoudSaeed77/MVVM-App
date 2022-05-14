//
//  Extensions.swift
//  Menu (Restaurant & Families)
//
//  Created by apple on 10/04/2022.
//

import UIKit

class AppButton: UIButton {
    let indicator: UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.tintColor = .white
        indicator.color = .white
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            indicator.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}

extension UIViewController {
    
    func configTitles(title: String) {
        self.navigationItem.title = title
    }
    
    func alert(success: Bool, withImage: Bool, message: String, completion: @escaping() -> Void)  {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let imageView: UIImageView = {
            let img = UIImageView()
            img.translatesAutoresizingMaskIntoConstraints = false
            return img
        }()
        switch success {
        case true:
            imageView.image = #imageLiteral(resourceName: "done24Px")
            alert.title = "\nOperation success"
            alert.message = message
        case false:
            imageView.image = #imageLiteral(resourceName: "removeCircleOutline24Px")
            alert.title = "\nOperation Failed"
            let attributedString = NSAttributedString(string: message, attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),
                NSAttributedString.Key.foregroundColor : UIColor.red
            ])
            alert.setValue(attributedString, forKey: "attributedMessage")
            alert.message = message
        }
        if withImage {
            alert.view.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor),
                imageView.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 10),
                imageView.widthAnchor.constraint(equalToConstant: 30),
                imageView.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
        let cancel = UIAlertAction(title: "Ok", style: .destructive) { _ in
            alert.dismiss(animated: true, completion: nil)
            completion()
        }
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
