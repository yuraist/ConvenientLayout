//
//  Extensions+UIView.swift
//  sad_crm
//
//  Created by Yura Istomin on 22/03/2019.
//  Copyright © 2019 Yura Istomin. All rights reserved.
//

import UIKit

public extension UIView {
  
  func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
    }
    
    if let leading = leading {
      leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
    }
    
    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
    }
    
    if let trailing = trailing {
      trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
    }
    
    anchorSize(to: size)
  }
  
  func fillSuperview() {
    anchor(top: superview?.topAnchor,
           leading: superview?.leadingAnchor,
           bottom: superview?.bottomAnchor,
           trailing: superview?.trailingAnchor)
  }
  
  func anchorSize(to view: UIView) {
    widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
  }
  
  func anchorSize(to size: CGSize = .zero) {
    if size.width != 0 {
      widthAnchor.constraint(equalToConstant: size.width).isActive = true
    }
    
    if size.height != 0 {
      heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }
  }
  
  func centerInSuperView(size: CGSize = .zero) {
    translatesAutoresizingMaskIntoConstraints = false
    
    if let superviewCenterXAnchor = superview?.centerXAnchor {
      centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
    }
    
    if let superviewCenterYAnchor = superview?.centerYAnchor {
      centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
    }
    
    anchorSize(to: size)
  }
  
  func addSubviews(_ views: UIView...) {
    for view in views {
      addSubview(view)
    }
  }
  
}
