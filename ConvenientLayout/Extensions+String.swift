//
//  Extensions+String.swift
//  sad_crm
//
//  Created by Yura Istomin on 12/05/2019.
//  Copyright © 2019 Yura Istomin. All rights reserved.
//

import UIKit

extension String {
  
  func height(withConstraintWidth width: CGFloat, font: UIFont = UIFont.systemFont(ofSize: 17)) -> CGFloat {
    let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
    let boundingBox = self.boundingRect(with: constraintRect,
                                        options: .usesLineFragmentOrigin,
                                        attributes: [NSAttributedString.Key.font: font],
                                        context: nil)
    
    return ceil(boundingBox.height)
  }
  
  func width(withConstraintHeight height: CGFloat, font: UIFont = UIFont.systemFont(ofSize: 17)) -> CGFloat {
    let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
    let boundingBox = self.boundingRect(with: constraintRect,
                                        options: .usesLineFragmentOrigin,
                                        attributes: [NSAttributedString.Key.font: font],
                                        context: nil)
    
    return ceil(boundingBox.width)
  }
  
  func replacingNewLine() -> String {
    return self.replacingOccurrences(of: "<br>", with: "\n")
  }
  
  func matches(forRegex regex: String) -> [String] {
    do {
      let regex = try NSRegularExpression(pattern: regex)
      let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
      
      return results.map {
        String(self[Range($0.range, in: self)!])
      }
    } catch {
      print("invalid regex: \(error.localizedDescription)")
      return []
    }
  }
  
}
