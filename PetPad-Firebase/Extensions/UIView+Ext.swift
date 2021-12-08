//
//  UIView+Ext.swift
//  PetPad-Firebase
//
//  Created by Sendo Tjiam on 08/12/21.
//

import UIKit

extension UIView {
    func addBorder(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    func addRoundedCorner(cornerPath: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: cornerPath, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    func addRoundedCorner(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
}
