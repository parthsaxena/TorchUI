//
//  PropertyIconView.swift
//  TorchUI
//
//  Created by Parth Saxena on 7/7/23.
//

import Foundation
import UIKit

class PropertyIconView: UIView {
    
    @IBOutlet weak var propertyImageView: UIImageView!
    @IBOutlet weak var propertyLabel: UILabel!
    @IBOutlet weak var propertyMainView: UIView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    var propertyName = ""
    static var instantiated = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }
    
    func configure(with propertyName: String) {
        
        self.propertyLabel.text = propertyName
        self.layoutIfNeeded()
    }
    
    class func instanceFromNib() -> PropertyIconView {
        let view = UINib(nibName: "PropertyIconView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? PropertyIconView ?? PropertyIconView()
        return view
    }
}
