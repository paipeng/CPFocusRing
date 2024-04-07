//
//  CPFocusRingDelegate.swift
//  CPFocusRing
//
//  Created by Pai Peng on 2024/4/7.
//

import Foundation

@objc public protocol CPFocusRingDelegate: AnyObject {
    func focus(focusDistance: CGFloat)
    
}
