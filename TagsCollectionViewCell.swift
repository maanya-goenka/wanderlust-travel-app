//
//  TagsCollectionViewCell.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/9/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class TagsCollectionViewCell: UICollectionViewCell {
    
    var filterLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        filterLabel = UILabel()
        filterLabel.layer.borderWidth = 1
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        filterLabel.layer.borderColor = UIColor(red: 0.36, green: 0.36, blue: 0.36, alpha: 1).cgColor
        filterLabel.layer.cornerRadius = 10
        filterLabel.textColor = UIColor(red: 0.36, green: 0.36, blue: 0.36, alpha: 1)
        filterLabel.font = UIFont(name: "AvenirNext-Medium", size: 13)
        filterLabel.textAlignment = .center
        contentView.addSubview(filterLabel)
        
        isSelected = false
        
        setUpConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraint() {
        
        NSLayoutConstraint.activate([
            filterLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            filterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            filterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            filterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
    }
    
    func configure(for filter: String) {
        filterLabel.text = filter
    }
    
    override var isSelected: Bool {
        didSet {
            super.isSelected = isSelected
            if isSelected {
                filterLabel.layer.borderColor = UIColor(red:1, green:0.45, blue:0.42, alpha:1.0).cgColor
                filterLabel.textColor = UIColor(red:1, green:0.45, blue:0.42, alpha:1.0)
            } else {
                filterLabel.layer.borderColor = UIColor(red: 0.36, green: 0.36, blue: 0.36, alpha: 1).cgColor
                filterLabel.textColor = UIColor(red: 0.36, green: 0.36, blue: 0.36, alpha: 1)
            }
            setNeedsDisplay()
        }
    }
    
    func selected() {
        filterLabel.textColor = UIColor(red:1, green:0.45, blue:0.42, alpha:1.0)
        filterLabel.layer.borderColor = UIColor(red:1, green:0.45, blue:0.42, alpha:1.0).cgColor
    }
    
    func deselected() {
        filterLabel.layer.borderColor = UIColor(red: 0.36, green: 0.36, blue: 0.36, alpha: 1).cgColor
        filterLabel.textColor = UIColor(red: 0.36, green: 0.36, blue: 0.36, alpha: 1)
    }
}

