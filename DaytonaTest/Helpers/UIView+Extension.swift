//
//  Utils.swift
//  DaytonaTest
//
//  Created by Softsuave on 06/10/2023.
//

import Foundation
import UIKit

extension UIView {
    func getBorderWithGray(_ width: CGFloat) {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = width
    }
}
