//
//  UIScrollView+Extension.swift
//  KeyboardHelper
//
//  Created by kimtaewan on 2016. 3. 30..
//  Copyright © 2016년 taewan. All rights reserved.
//

import Foundation
import UIKit


public let KeyboardHelperNoneUse: CGFloat = -1
private struct AssociatedKeys {
    static var keyboardHelper = "keyboardHelper"
}

private extension UIScrollView {
    var _keyboardHelper: KeyboardHelper?  {
        get {
            guard let helper = objc_getAssociatedObject(self, &AssociatedKeys.keyboardHelper) as? KeyboardHelper else { return nil }
            return helper
        }
        set(value) {
            objc_setAssociatedObject(self, &AssociatedKeys.keyboardHelper, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}


//MARK: - Inpectable
public extension UIScrollView {
    
    @IBInspectable var keyboardFocusedSpace: CGFloat {
        get { return _keyboardHelper?.baseLineSpace ?? KeyboardHelperNoneUse }
        set {
            if newValue < 0 {
                _keyboardHelper?.scrollView = nil
                _keyboardHelper = nil
                return
            }
            
            if _keyboardHelper == nil {
                _keyboardHelper = KeyboardHelper()
                _keyboardHelper!.scrollView = self
            }
            _keyboardHelper?.baseLineSpace = newValue
        }
    }
}
