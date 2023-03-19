//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Aybike Zeynep Tiryaki on 17.03.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
