//
//  FinalScoreCell.swift
//  Brewer
//
//  Created by Maciej Oczko on 09.04.2016.
//  Copyright © 2016 Maciej Oczko. All rights reserved.
//

import Foundation
import UIKit

final class FinalScoreCell: UITableViewCell, Highlightable {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    var normalColor: UIColor?
    var highlightColor: UIColor?
    
    override var highlighted: Bool {
        didSet {
            highlightViews([self, titleLabel, valueLabel], highlighted: highlighted)
        }
    }
}

extension FinalScoreCell: PresentableConfigurable {
    
    func configureWithPresentable(presentable: TitleValuePresentable) {
        accessibilityHint = "Represents brew score that equals \(presentable.value)"
        titleLabel.text = presentable.title
        valueLabel.text = presentable.value
    }
}

extension FinalScoreCell {
    
    func configureWithTheme(theme: ThemeConfiguration?) {
        super.configureWithTheme(theme)
        [titleLabel, valueLabel].forEach {
            $0.configureWithTheme(theme)
        }
        normalColor = theme?.lightColor
        highlightColor = highlightColorForTheme(theme)
    }
}
