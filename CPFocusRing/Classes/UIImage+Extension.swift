//
//  UIImage+Extension.swift
//  CPFocusRing
//
//  Created by Pai Peng on 2024/4/9.
//

import UIKit


extension UIImage {
    func cropImage(rect: CGRect) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: rect.size.width, height: rect.size.height), true, 0.0)
        self.draw(at: CGPoint(x: -rect.origin.x, y: -rect.origin.y))
        let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return croppedImage
    }
}
