//
//  UIKitUtilities.swift
//  Brewer
//
//  Created by Maciej Oczko on 01.05.2016.
//  Copyright © 2016 Maciej Oczko. All rights reserved.
//

import Foundation
import UIKit

// MARK: Font

extension UIFont {
	static func avenirBook(size: CGFloat) -> UIFont? {
		return UIFont(name: "Avenir-Book", size: size)
	}

	static func avenirMedium(size: CGFloat) -> UIFont? {
		return UIFont(name: "Avenir-Medium", size: size)
	}
}

// MARK: Image

extension UIImage {

	func alwaysOriginal() -> UIImage {
		return imageWithRenderingMode(.AlwaysOriginal)
	}
}

// MARK: UITableView

extension UITableView {
    func hideSearchBar(animated animated: Bool = false) {
		if let bar = self.tableHeaderView as? UISearchBar {
			let height = bar.frame.height
			let offset = contentOffset.y
			if offset < height {
                setContentOffset(CGPoint(x: 0, y: height), animated: animated)
			}
		}
	}
    
    func showSearchBar(animated animated: Bool = false) {
        if let _ = self.tableHeaderView as? UISearchBar {
            if contentOffset.y != 0 {
                setContentOffset(CGPoint.zero, animated: animated)
            }
        }
    }
}

// MARK: UIScrollView

extension UIScrollView {
    
    func scrollVerticallyToPageAtIndex(index: Int) {
        setContentOffset(CGPoint(x: CGFloat(index) * frame.width, y: 0), animated: true)
    }
}

// MARK: UIView

extension UIView {

	static func viewWithBackgroundColor(color: UIColor?) -> UIView {
		let view = UIView()
		view.backgroundColor = color
		return view
	}
}
