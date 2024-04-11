//
//  CPFocusRing.swift
//  CPFocusRing
//
//  Created by Pai Peng on 2024/4/7.
//

import UIKit

@objc public class CPFocusRing: UIView {
    var ringView: CPRingView?
    public init(frame: CGRect, focusDistance: CGFloat) {
        super.init(frame: frame)
        self.initView(focusDistance: focusDistance)
    }
    // for using in code
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.initView(focusDistance: 0)
    }
    
    // for using in IB
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initView(focusDistance: 0)
    }
    
    private func initView(focusDistance: CGFloat) {
        var image: UIImage
        let podBundle = Bundle(for: CPFocusRing.self)
        if let path = podBundle.path(forResource: "CPFocusRing", ofType: "bundle") {
            let bundle = Bundle(path: path)!
            image = UIImage(named: "Scale", in: bundle, compatibleWith: nil)!
        } else {
            image = UIImage(named: "Scale", in: podBundle, compatibleWith: nil)!
            
        }
        
        //Image View
        /*
        let imageView = UIImageView()
        //imageView.backgroundColor = UIColor.yellow
        imageView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
         */

        print("frame size: \(self.frame.width)")
        ringView = CPRingView(frame: CGRectMake(0, 0, self.frame.width, 80))
        
        ringView!.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        ringView!.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        //ringView.backgroundColor = UIColor.yellow
        print("ringView width: \(ringView?.frame.size.width)")
        
        print("image size: \(image.size)")
        let offsetX = (self.frame.size.width - 240)/2 * 40 / 152
        print("offsetX: \(offsetX)")
        //offsetX = 0
        image = image.cropImage(rect: CGRectMake(offsetX, 0, image.size.width - offsetX * 2, image.size.height))!
        print("crop image size: \(image.size)")
        ringView!.setImage(image: image)
        ringView!.setFocusDistance(focusDistance: focusDistance)

        /*
        //Text Label
        let textLabel = UILabel()
        textLabel.backgroundColor = UIColor.yellow
        textLabel.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        textLabel.text  = "Hi World"
        textLabel.textAlignment = .center
         */

        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 16.0

        //stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(ringView!)
        //stackView.addArrangedSubview(textLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(stackView)

        //Constraints
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.backgroundColor = .red
    }
    
    open func setFocus(focus: CGFloat) {
        self.ringView!.setFocusDistance(focusDistance: focus)
    }
    
    open func setDelegate(delegate: CPFocusRingDelegate) {
        self.ringView!.delegate = delegate
    }
}
