//
//  PropertyIconView.swift
//  TorchUI
//
//  Created by Parth Saxena on 7/7/23.
//

import Foundation
import UIKit

class DetectorIconView: UIView {
    
    @IBOutlet weak var detectorImageView: UIImageView!
    @IBOutlet weak var detectorLabel: UILabel!
    @IBOutlet weak var detectorMainView: UIView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    var detectorName = ""
    static var instantiated = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }
    
    func configure(with detectorName: String, threat: Threat) {
        
        self.detectorLabel.text = detectorName
        if threat == Threat.Red {
            self.detectorImageView.image = UIImage(named: "DetectorIcons/ThreatRed")
        } else if threat == Threat.Yellow {
            self.detectorImageView.image = UIImage(named: "DetectorIcons/ThreatYellow")
        }
        self.layoutIfNeeded()
    }
    
    class func instanceFromNib() -> DetectorIconView {
        let view = UINib(nibName: "DetectorIconView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DetectorIconView
        return view
    }
    
    
    fileprivate func setupView() {
        // do your setup here
    }
}
